# -*- coding: utf-8 -*-
ActiveAdmin.register Category do
  menu parent: I18n.t('app.active_admin.category'), priority: 3
  
  config.sort_order = "name_asc"

  filter :name

  index do
    column :id
    column :name
    default_actions
  end

  form do |f|
    f.inputs do
      f.input :name
    end

    f.actions
  end
    
  show title: :name do |city|
    attributes_table do
      row :name      
    end

    active_admin_comments
  end

end
