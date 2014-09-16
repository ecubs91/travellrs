json.array!(@trips) do |trip|
  json.extract! trip, :id, :destination, :starting_date, :end_date, :interests, :user_id
  json.url trip_url(trip, format: :json)
end
