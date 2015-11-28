json.array!(@checkins) do |checkin|
  json.extract! checkin, :id, :user_id, :location_name, :active
  json.url checkin_url(checkin, format: :json)
end
