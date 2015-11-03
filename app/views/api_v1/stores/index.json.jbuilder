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
  json.hours_monday e.hours_monday
  json.hours_tuesday e.hours_tuesday
  json.hours_wensday e.hours_wensday
  json.hours_thursday e.hours_thursday
  json.hours_friday  e.hours_friday 
  json.hours_saturday e.hours_saturday
  json.hours_sunday  e.hours_sunday 
  json.comments_count e.comments_count
end