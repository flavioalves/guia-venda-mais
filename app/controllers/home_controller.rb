class HomeController < ApplicationController
  layout 'home'
  def index
    @categorias = Category.all
    @cidades = City.all 
    @destaques = Company.includes(:categorys).limit(3)
  end

end
