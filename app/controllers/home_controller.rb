class HomeController < ApplicationController

  def index
    @categorias = Category.all
    @cidades = City.all 
  end

end
