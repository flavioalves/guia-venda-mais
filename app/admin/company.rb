# -*- coding: utf-8 -*-
ActiveAdmin.register Company do
  menu parent: I18n.t('app.active_admin.company'), priority: 3
  
  config.per_page = 30
  config.sort_order = "name_asc"

  filter :name
  filter :featured
  filter :citys_name, as: :string
  filter :categorys_name, as: :string


  index do
    column :id
    column :name
    column :featured      
    default_actions
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :address
      f.input :description, as: :ckeditor
      #f.input :description
      f.input :owner
      f.input :phone
      f.input :website
      f.input :featured
      f.input :citys, as: :select, include_blank: true, :input_html => { :multiple => true }
      f.input :categorys, as: :select, include_blank: true, :input_html => { :multiple => true }
    end

    f.actions
  end
    
  show title: :name do |company|
    attributes_table do
      row :name
      row :address
      row :description do company.description.html_safe end
      row :owner
      row :phone
      row :website      
      row :featured  
      table_for company.citys do
        column "Cidades" do |city|
          city.name
        end
      end
         
      table_for company.categorys do
        column "Categorias" do |category|
          category.name
        end
      end          
    end

    active_admin_comments
  end

end
