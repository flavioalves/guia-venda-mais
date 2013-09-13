class HomeController < ApplicationController

  def index
    @categorias = Category.all
    @cidades = City.all 
    @destaques = Company.includes(:categorys).limit(3)
  end

end
