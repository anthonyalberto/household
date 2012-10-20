class BalanceUtilisateursController < ApplicationController
  # GET /balance_utilisateurs
  # GET /balance_utilisateurs.json
  def index
    @balance_utilisateurs = BalanceUtilisateur.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @balance_utilisateurs }
    end
  end

  # GET /balance_utilisateurs/1
  # GET /balance_utilisateurs/1.json
  def show
    @balance_utilisateur = BalanceUtilisateur.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @balance_utilisateur }
    end
  end

  # GET /balance_utilisateurs/new
  # GET /balance_utilisateurs/new.json
  def new
    @balance_utilisateur = BalanceUtilisateur.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @balance_utilisateur }
    end
  end

  # GET /balance_utilisateurs/1/edit
  def edit
    @balance_utilisateur = BalanceUtilisateur.find(params[:id])
  end

  # POST /balance_utilisateurs
  # POST /balance_utilisateurs.json
  def create
    @balance_utilisateur = BalanceUtilisateur.new(params[:balance_utilisateur])

    respond_to do |format|
      if @balance_utilisateur.save
        format.html { redirect_to @balance_utilisateur, notice: 'Balance utilisateur was successfully created.' }
        format.json { render json: @balance_utilisateur, status: :created, location: @balance_utilisateur }
      else
        format.html { render action: "new" }
        format.json { render json: @balance_utilisateur.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /balance_utilisateurs/1
  # PUT /balance_utilisateurs/1.json
  def update
    @balance_utilisateur = BalanceUtilisateur.find(params[:id])

    respond_to do |format|
      if @balance_utilisateur.update_attributes(params[:balance_utilisateur])
        format.html { redirect_to @balance_utilisateur, notice: 'Balance utilisateur was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @balance_utilisateur.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /balance_utilisateurs/1
  # DELETE /balance_utilisateurs/1.json
  def destroy
    @balance_utilisateur = BalanceUtilisateur.find(params[:id])
    @balance_utilisateur.destroy

    respond_to do |format|
      format.html { redirect_to balance_utilisateurs_url }
      format.json { head :no_content }
    end
  end
end
