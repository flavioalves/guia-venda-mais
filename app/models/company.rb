class Company < ActiveRecord::Base
  attr_accessible :address, 
                  :description, 
                  :name, 
                  :owner, 
                  :phone, 
                  :website,
                  :city_ids, 
                  :category_ids,
                  :featured

  has_and_belongs_to_many :citys
  has_and_belongs_to_many :categorys
end
