class AddRefsToCompany < ActiveRecord::Migration
  def change
    create_table :citys_companys do |t|
      t.belongs_to :city
      t.belongs_to :company
    end

    create_table :categorys_companys do |t|
      t.belongs_to :category
      t.belongs_to :company
    end 
  end
end
