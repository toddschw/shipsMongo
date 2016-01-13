class WelcomeController < ApplicationController
  def index
    render plain: "Wecome to the API..."
  end
end
