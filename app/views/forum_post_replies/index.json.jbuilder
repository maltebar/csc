json.array!(@forum_post_replies) do |forum_post_reply|
  json.extract! forum_post_reply, :id
  json.url forum_post_reply_url(forum_post_reply, format: :json)
end
