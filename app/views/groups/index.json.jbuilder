json.array!(@groups) do |group|
  json.extract! group, :id, :Checkin_id, :user_id, :group_name, :checkin_id
  json.url group_url(group, format: :json)
end
