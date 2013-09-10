class CreateCitys < ActiveRecord::Migration
  def change
    create_table :citys do |t|
      t.string :name

      t.timestamps
    end
  end
end
