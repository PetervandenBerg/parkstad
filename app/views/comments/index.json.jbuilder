json.array!(@comments) do |comment|
  json.extract! comment, :comment, :user_name
  json.url comment_url(comment, format: :json)
end
