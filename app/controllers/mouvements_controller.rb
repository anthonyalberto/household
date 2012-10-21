class MouvementsController < ApplicationController
  # GET /mouvements
  # GET /mouvements.json
  def index
    @mouvements = Mouvement.order("fini DESC, id DESC").page(params[:page]).per(100)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mouvements }
    end
  end

  # GET /mouvements/1
  # GET /mouvements/1.json
  def show
    @mouvement = Mouvement.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mouvement }
    end
  end

  # GET /mouvements/new
  # GET /mouvements/new.json
  def new
    @mouvement = Mouvement.new
    @mouvement.payeur = current_utilisateur

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mouvement }
    end
  end

  # GET /mouvements/1/edit
  def edit
    @mouvement = Mouvement.find(params[:id])
  end

  # POST /mouvements
  # POST /mouvements.json
  def create
    @mouvement = Mouvement.new(params[:mouvement])

    respond_to do |format|
      if @mouvement.save
        format.html { redirect_to @mouvement, notice: 'Mouvement was successfully created.' }
        format.json { render json: @mouvement, status: :created, location: @mouvement }
      else
        format.html { render action: "new" }
        format.json { render json: @mouvement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /mouvements/1
  # PUT /mouvements/1.json
  def update
    @mouvement = Mouvement.find(params[:id])

    respond_to do |format|
      if @mouvement.update_attributes(params[:mouvement])
        Balance.current.recalculate!
        format.html { redirect_to @mouvement, notice: 'Mouvement was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mouvement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mouvements/1
  # DELETE /mouvements/1.json
  def destroy
    @mouvement = Mouvement.find(params[:id])
    @mouvement.destroy
    Balance.current.recalculate!
    flash[:notice] = "Supprime avec succes"

    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
    end
  end

  def new_paiements
    @mouvements = []
    30.times do
      @mouvements << Mouvement.new(payeur_id: current_utilisateur.id)
    end
    @title = "Nouveaux paiements"
    @form_url = create_mouvements_path
    @revenu = false
    @mode = "new"
    render action: :mouvements
  end

  def new_revenus
    @mouvements = []
    30.times do
      @mouvements << Mouvement.new(payeur_id: current_utilisateur.id, revenu: true)
    end
    @title = "Nouveaux revenus"
    @revenu = true
    @form_url = create_mouvements_path
    @mode = "new"
    render action: :mouvements
  end

  def edit_paiements
    @other_user = Utilisateur.where("id != ?", current_utilisateur.id).first
    @mouvements_main = Mouvement.where(payeur_id: current_utilisateur.id, revenu: false, fini: 0).order("id DESC")
    @mouvements_second = Mouvement.where(payeur_id: @other_user, revenu: false, fini: 0).order("id DESC")
    @balance = Balance.current
    @is_primary_user = true if current_utilisateur.id == 1

    if @is_primary_user
      @left_user = @other_user
      @right_user = current_utilisateur
    else
      @left_user = current_utilisateur
      @right_user = @other_user
    end


  end

  def edit_revenus
    @mouvements = Mouvement.where(payeur_id: current_utilisateur.id, revenu: true).order("id DESC")
    @title = "Revenus"
    @revenu = true
    @form_url = update_mouvements_path
    @mode = "edit"
    render action: :mouvements
  end

  def create_mouvements
    #begin
    params[:mouvements].each do |mouvement|
      next if mouvement[:montant].blank? || mouvement[:type_de_mouvement_id].blank?
      Mouvement.create(mouvement)
    end

    if params[:revenu] == "true"
      redirect_to :edit_revenus, notice: 'Succes, les nouveaux revenus ont ete ajoute a la liste ci-dessous'
    else
      redirect_to :edit_paiements, notice: 'Succes, les nouveaux paiements ont ete ajoute a la liste ci-dessous'
    end


  end

  def update_mouvements
    #params[:mouvements].each do |mouvement|
      #next if mouvement[:montant].blank? || mouvement[:type_de_mouvement_id].blank?
      Mouvement.update(params[:mouvements].keys, params[:mouvements].values)
    #end
    Balance.current.recalculate!
    redirect_to :edit_paiements, notice: 'Succes, les paiements ont ete modifies'
  end


end
