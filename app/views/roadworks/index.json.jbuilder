json.array!(@roadworks) do |roadwork|
  json.extract! roadwork, :id, :description, :startdate, :enddate, :latitude, :longitude, :tags, :submitteddate
  json.url roadwork_url(roadwork, format: :json)
end
