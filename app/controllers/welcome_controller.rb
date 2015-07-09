class WelcomeController < ApplicationController
  def index
  end

  def about
  end
  
  def contact
  end
  
  def vacation
    @location = "Paris"
  end
end
