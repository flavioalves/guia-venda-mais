class CompanysController < ApplicationController
  
  def show
    @categorias = Category.all
    @cidades = City.all

    @empresas = Company.includes(:categorys).all
  end
end
