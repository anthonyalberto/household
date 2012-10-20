class TestController < ApplicationController

  def index
    render text: "Seulement pour les membres"
  end

end