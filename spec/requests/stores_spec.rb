require 'rails_helper'

RSpec.describe "Stores", type: :request do
  describe "GET /stores" do
    it "should stores list" do
      e1 = Store.create!( :name => "foo", :category_id => 1, :phone => "foo", :description => "foo", :hours => "foo", :location_city => "foo", :location_address => "foo", :coordinate_lat => "foo", :coordinate_lon => "foo", :yelp_image => "foo")
      e2 = Store.create!( :name => "bar", :category_id => 2, :phone => "bar", :description => "bar", :hours => "bar", :location_city => "bar", :location_address => "bar", :coordinate_lat => "bar", :coordinate_lon => "bar", :yelp_image => "bar")

      e1.reload
      e2.reload

      get "/api/v1/stores"

      expected_response_data = { "metadata" => { "total" =>2 },
               "data"=>[
                { "id"=> e1.id, "category_id"=> e1.category_id ,"name"=> e1.name, "phone"=>"foo", "description"=>"foo", "hours"=>"foo", 
                  "city"=> "foo", "address"=> "foo", "lat"=> "foo","lon"=> "foo","yelp_image"=> "foo"},
                { "id"=> e2.id, "category_id"=> e2.category_id ,"name"=> e2.name, "phone"=>"bar", "description"=>"bar", "hours"=>"bar", 
                  "city"=> "bar", "address"=> "bar", "lat"=> "bar","lon"=> "bar","yelp_image"=> "bar"}
               ]
              }

      expect( response ).to have_http_status(200)
      expect( response.body ).to eq( expected_response_data.to_json )
    end
  end

end