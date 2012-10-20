class MouvementsController < ApplicationController
  # GET /mouvements
  # GET /mouvements.json
  def index
    @mouvements = Mouvement.order("fini DESC, id DESC")

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

    respond_to do |format|
      format.html { redirect_to mouvements_url }
      format.json { head :no_content }
    end
  end
end
