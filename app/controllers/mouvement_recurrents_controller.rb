class MouvementRecurrentsController < ApplicationController
  # GET /mouvement_recurrents
  # GET /mouvement_recurrents.json
  def index
    @mouvement_recurrents = MouvementRecurrent.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mouvement_recurrents }
    end
  end

  # GET /mouvement_recurrents/1
  # GET /mouvement_recurrents/1.json
  def show
    @mouvement_recurrent = MouvementRecurrent.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mouvement_recurrent }
    end
  end

  # GET /mouvement_recurrents/new
  # GET /mouvement_recurrents/new.json
  def new
    @mouvement_recurrent = MouvementRecurrent.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mouvement_recurrent }
    end
  end

  # GET /mouvement_recurrents/1/edit
  def edit
    @mouvement_recurrent = MouvementRecurrent.find(params[:id])
  end

  # POST /mouvement_recurrents
  # POST /mouvement_recurrents.json
  def create
    @mouvement_recurrent = MouvementRecurrent.new(params[:mouvement_recurrent])

    respond_to do |format|
      if @mouvement_recurrent.save
        format.html { redirect_to @mouvement_recurrent, notice: 'Mouvement recurrent was successfully created.' }
        format.json { render json: @mouvement_recurrent, status: :created, location: @mouvement_recurrent }
      else
        format.html { render action: "new" }
        format.json { render json: @mouvement_recurrent.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /mouvement_recurrents/1
  # PUT /mouvement_recurrents/1.json
  def update
    @mouvement_recurrent = MouvementRecurrent.find(params[:id])

    respond_to do |format|
      if @mouvement_recurrent.update_attributes(params[:mouvement_recurrent])
        format.html { redirect_to @mouvement_recurrent, notice: 'Mouvement recurrent was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mouvement_recurrent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mouvement_recurrents/1
  # DELETE /mouvement_recurrents/1.json
  def destroy
    @mouvement_recurrent = MouvementRecurrent.find(params[:id])
    @mouvement_recurrent.destroy

    respond_to do |format|
      format.html { redirect_to mouvement_recurrents_url }
      format.json { head :no_content }
    end
  end
end
