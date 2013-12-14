json.array!(@weeklies) do |weekly|
  json.extract! weekly, :id, :title, :body, :body_html
  json.url weekly_url(weekly, format: :json)
end
