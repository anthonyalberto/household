class HomeController < ApplicationController
  skip_before_filter :authenticate_utilisateur!
  def index
    if !current_utilisateur
      render nothing: true
      return
    end

    @chat = current_utilisateur.chat

  end
end