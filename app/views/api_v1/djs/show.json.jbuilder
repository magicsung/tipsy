json.data
  json.id @dj.id
  json.name @dj.name
  json.photo @dj.abs_url + @dj.photo.url
  json.playlist @dj.playlists do |x|
    json.title x.title
    json.content x.content
  end