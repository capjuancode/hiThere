json.array!(@camaras) do |camara|
  json.extract! camara, :id, :title
  json.url camara_url(camara, format: :json)
end
