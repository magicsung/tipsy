json.metadata do
  json.total @category.count
end

json.data @category do |e|
  json.id e.id
  json.name e.name
  json.description e.description
  json.image asset_url(e.image.url)
end