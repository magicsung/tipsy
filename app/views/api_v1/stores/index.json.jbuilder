json.metadata do
  json.total Store.count
end

json.data @store do |e|
  json.id e.id
  json.category_id e.category_id
  json.name e.name
  json.photo asset_url(e.photo.url)
  json.phone e.phone
  json.description e.description
  json.city e.location_city
  json.address e.location_address
  json.lat e.coordinate_lat
  json.lon e.coordinate_lon
  json.comments_count e.comments_count.to_s
  json.updated_at e.updated_at.strftime("%F")
end