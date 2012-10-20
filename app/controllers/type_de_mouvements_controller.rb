class TypeDeMouvementsController < ApplicationController
  # GET /type_de_mouvements
  # GET /type_de_mouvements.json
  def index
    @type_de_mouvements = TypeDeMouvement.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @type_de_mouvements }
    end
  end

  # GET /type_de_mouvements/1
  # GET /type_de_mouvements/1.json
  def show
    @type_de_mouvement = TypeDeMouvement.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @type_de_mouvement }
    end
  end

  # GET /type_de_mouvements/new
  # GET /type_de_mouvements/new.json
  def new
    @type_de_mouvement = TypeDeMouvement.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @type_de_mouvement }
    end
  end

  # GET /type_de_mouvements/1/edit
  def edit
    @type_de_mouvement = TypeDeMouvement.find(params[:id])
  end

  # POST /type_de_mouvements
  # POST /type_de_mouvements.json
  def create
    @type_de_mouvement = TypeDeMouvement.new(params[:type_de_mouvement])

    respond_to do |format|
      if @type_de_mouvement.save
        format.html { redirect_to @type_de_mouvement, notice: 'Type de mouvement was successfully created.' }
        format.json { render json: @type_de_mouvement, status: :created, location: @type_de_mouvement }
      else
        format.html { render action: "new" }
        format.json { render json: @type_de_mouvement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /type_de_mouvements/1
  # PUT /type_de_mouvements/1.json
  def update
    @type_de_mouvement = TypeDeMouvement.find(params[:id])

    respond_to do |format|
      if @type_de_mouvement.update_attributes(params[:type_de_mouvement])
        format.html { redirect_to @type_de_mouvement, notice: 'Type de mouvement was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @type_de_mouvement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /type_de_mouvements/1
  # DELETE /type_de_mouvements/1.json
  def destroy
    @type_de_mouvement = TypeDeMouvement.find(params[:id])
    @type_de_mouvement.destroy

    respond_to do |format|
      format.html { redirect_to type_de_mouvements_url }
      format.json { head :no_content }
    end
  end
end
