class MonnaiesController < ApplicationController
  # GET /monnaies
  # GET /monnaies.json
  def index
    @monnaies = Monnaie.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @monnaies }
    end
  end

  # GET /monnaies/1
  # GET /monnaies/1.json
  def show
    @monnaie = Monnaie.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @monnaie }
    end
  end

  # GET /monnaies/new
  # GET /monnaies/new.json
  def new
    @monnaie = Monnaie.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @monnaie }
    end
  end

  # GET /monnaies/1/edit
  def edit
    @monnaie = Monnaie.find(params[:id])
  end

  # POST /monnaies
  # POST /monnaies.json
  def create
    @monnaie = Monnaie.new(params[:monnaie])

    respond_to do |format|
      if @monnaie.save
        format.html { redirect_to @monnaie, notice: 'Monnaie was successfully created.' }
        format.json { render json: @monnaie, status: :created, location: @monnaie }
      else
        format.html { render action: "new" }
        format.json { render json: @monnaie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /monnaies/1
  # PUT /monnaies/1.json
  def update
    @monnaie = Monnaie.find(params[:id])

    respond_to do |format|
      if @monnaie.update_attributes(params[:monnaie])
        format.html { redirect_to @monnaie, notice: 'Monnaie was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @monnaie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /monnaies/1
  # DELETE /monnaies/1.json
  def destroy
    @monnaie = Monnaie.find(params[:id])
    @monnaie.destroy

    respond_to do |format|
      format.html { redirect_to monnaies_url }
      format.json { head :no_content }
    end
  end
end
