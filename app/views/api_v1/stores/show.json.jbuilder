json.id @store.id
json.category_id @store.category_id
json.name @store.name
json.photo asset_url(@store.photo.url)
json.phone @store.phone
json.description @store.description
json.city @store.location_city
json.address @store.location_address
json.hours_monday @store.hours_monday
json.hours_tuesday @store.hours_tuesday
json.hours_wensday @store.hours_wensday
json.hours_thursday @store.hours_thursday
json.hours_friday  @store.hours_friday 
json.hours_saturday @store.hours_saturday
json.hours_sunday  @store.hours_sunday 

json.comment @store.comments do |e|
  json.photo e.user.image
  json.rating e.rating
  json.content e.content
  json.user e.user.name
  json.time time_ago_in_words(e.created_at)+" ago"
end