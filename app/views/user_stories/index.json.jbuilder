json.array!(@user_stories) do |user_story|
  json.extract! user_story, :id, :param1, :param2, :param3, :references
  json.url user_story_url(user_story, format: :json)
end
