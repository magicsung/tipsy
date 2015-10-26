json.metadata do
  json.total Event.count
end

json.data @event do |e|
  json.id e.id
  json.title e.title
  json.image e.event_image
end