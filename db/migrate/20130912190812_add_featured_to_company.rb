class AddFeaturedToCompany < ActiveRecord::Migration
  def change
    add_column :companys, :featured, :boolean
  end
end
