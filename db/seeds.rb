# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)


products =  [
              {:name=>"Product 1",
              :description=>"Product 1 description", 
              :price=>"10"},
              
              {:name=>"Product 2",
              :description=>"Product 2 description", 
              :price=>"10"},
              
              {:name=>"Product 3",
              :description=>"Product 3 description", 
              :price=>"25"},
              
              {:name=>"Product 4 very very very long name for this product, very very very long",
              :description=>"Product 3 description", 
              :price=>"25"}
            ]
            
products.each do |p|
  Product.create! p
end