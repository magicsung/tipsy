json.metadata do
  json.total Event.count
end

json.data @event do |e|
  json.id e.id
  json.title e.title
  json.image e.event_image
  json.dj e.djs do |x|
    json.name x.name
    json.url x.abs_url + v1_dj_path(x)
  end
end