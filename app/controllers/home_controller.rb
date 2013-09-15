class HomeController < ApplicationController
  layout 'home'
  def index
    @categorias = Category.all
    @cidades = City.all 
    @destaques = Company.where(' featured = ? ', true).includes(:categorys).sample(3)
  end

end
