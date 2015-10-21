json.metadata do
  json.total Store.count
end

json.data @store do |e|
  json.id e.id
  json.category_id e.category_id
  json.name e.name
  json.phone e.phone
  json.description e.description
  json.hours e.hours
  json.city e.location_city
  json.address e.location_address
  json.lat e.coordinate_lat
  json.lon e.coordinate_lon
  json.yelp_image e.yelp_image
end