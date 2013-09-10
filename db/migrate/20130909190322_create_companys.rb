class CreateCompanys < ActiveRecord::Migration
  def change
    create_table :companys do |t|
      t.string :name
      t.string :phone
      t.string :address
      t.string :website
      t.text :description
      t.string :owner

      t.timestamps
    end
  end
end
