class TexteDeChatsController < ApplicationController
  # GET /texte_de_chats
  # GET /texte_de_chats.json
  def index
    @texte_de_chats = TexteDeChat.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @texte_de_chats }
    end
  end

  # GET /texte_de_chats/1
  # GET /texte_de_chats/1.json
  def show
    @texte_de_chat = TexteDeChat.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @texte_de_chat }
    end
  end

  # GET /texte_de_chats/new
  # GET /texte_de_chats/new.json
  def new
    @texte_de_chat = TexteDeChat.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @texte_de_chat }
    end
  end

  # GET /texte_de_chats/1/edit
  def edit
    @texte_de_chat = TexteDeChat.find(params[:id])
  end

  # POST /texte_de_chats
  # POST /texte_de_chats.json
  def create
    @texte_de_chat = TexteDeChat.new(params[:texte_de_chat])

    respond_to do |format|
      if @texte_de_chat.save
        format.html { redirect_to @texte_de_chat, notice: 'Texte de chat was successfully created.' }
        format.json { render json: @texte_de_chat, status: :created, location: @texte_de_chat }
      else
        format.html { render action: "new" }
        format.json { render json: @texte_de_chat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /texte_de_chats/1
  # PUT /texte_de_chats/1.json
  def update
    @texte_de_chat = TexteDeChat.find(params[:id])

    respond_to do |format|
      if @texte_de_chat.update_attributes(params[:texte_de_chat])
        format.html { redirect_to @texte_de_chat, notice: 'Texte de chat was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @texte_de_chat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /texte_de_chats/1
  # DELETE /texte_de_chats/1.json
  def destroy
    @texte_de_chat = TexteDeChat.find(params[:id])
    @texte_de_chat.destroy

    respond_to do |format|
      format.html { redirect_to texte_de_chats_url }
      format.json { head :no_content }
    end
  end
end
