class HomeController < ApplicationController
  skip_before_filter :authenticate_utilisateur!
  def index
    if !current_utilisateur
      @chat = Chat.all.sample
      render layout: "guest"
      return
    end

    @chat = current_utilisateur.chat

  end
end