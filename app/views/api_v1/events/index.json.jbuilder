json.metadata do
  json.total Event.count
end

json.data @event do |e|
  json.id e.id
  json.title e.title
  json.image asset_url(e.edm.url)
  json.dj e.djs do |x|
    json.id x.id
    json.name x.name
    json.url v1_dj_url(x)
  end
end