class CompanysController < ApplicationController
  
  def show
    @categorias = Category.all
    @cidades = City.all 
    @destaques = Company.includes(:categorys).limit(3)

    category_id = params[:category_id]
    city_id = params[:city_id]

    if !category_id.blank? && !city_id.blank?
      @empresas = Company.where(' categorys.id = ? AND citys.id = ?', category_id, city_id).includes(:categorys, :citys)
    elsif !category_id.blank? and city_id.blank?
      @empresas = Company.where(' categorys.id = ? ', category_id).includes(:categorys, :citys)
    elsif category_id.blank? and !city_id.blank?  
      @empresas = Company.where(' citys.id = ?', city_id).includes(:categorys, :citys)
    else
      @empresas = Company.includes(:categorys).all     
    end

  
  end
end
