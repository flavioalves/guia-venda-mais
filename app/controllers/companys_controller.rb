class CompanysController < ApplicationController

  def show
    @categorias = Category.all
    @cidades = City.all 

    category_id = params[:category_id]
    city_id = params[:city_id]

    if !category_id.blank? && !city_id.blank?
      @empresas = Company.where(' categorys.id = ? AND citys.id = ?', category_id, city_id).includes(:categorys, :citys)
      @destaques = getFeaturedCompanysByCategory(category_id)

    elsif !category_id.blank? and city_id.blank?
      @empresas = Company.where(' categorys.id = ? ', category_id).includes(:categorys, :citys)
      @destaques = getFeaturedCompanysByCategory(category_id)

    elsif category_id.blank? and !city_id.blank?  
      @empresas = Company.where(' citys.id = ?', city_id).includes(:categorys, :citys)
      @destaques = Company.includes(:categorys).sample(3)
    else
      @empresas = Company.includes(:categorys).all     
      @destaques = Company.includes(:categorys).sample(3)
    end  
  end


  def getFeaturedCompanysByCategory(category_id)
    destaques = Company.where(' categorys.id = ? AND featured = ?', category_id, true).includes(:categorys).sample(3).to_a  
    if destaques.count < 3
      destaques.concat(Company.where(' featured = ?', true).includes(:categorys).limit(3 - destaques.count))
    end  

    return destaques
  end  
end
