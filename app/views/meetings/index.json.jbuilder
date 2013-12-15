json.array!(@meetings) do |meeting|
  json.extract! meeting, :id, :title, :body, :body_html
  json.url meeting_url(meeting, format: :json)
end
