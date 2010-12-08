# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

variants_1 = {:size => ["S","M","L","XL"]}

variants_2 = {:size => ["XS","S","M","L"]}
  
variants_3 = {:size => ["S","M","L"]}

products =  [
              {:name=>"Product 1",
              :description=>"Product 1 description", 
              :price=>"10",
              :shipping_group => 1,
              :variants => variants_1},
              
              {:name=>"Product 2",
              :description=>"Product 2 description", 
              :price=>"10",
              :shipping_group => 1,
              :variants => variants_2},
              
              {:name=>"Product 3",
              :description=>"Product 3 description", 
              :price=>"25",
              :shipping_group => 2,
              :variants => variants_3},
              
              {:name=>"Product 4",
              :description=>"Product 4 description", 
              :price=>"25",
              :shipping_group => 3}
            ]


  

            
products.each do |p|
  Product.create! p
end