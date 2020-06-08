json.array!(@resources) do |resource|
  json.extract! resource, :id, :title, :subtitle, :author, :producedby, :edition, :description, :series, :controlno, :publisher, :publishdate
  json.url resource_url(resource, format: :json)
end
