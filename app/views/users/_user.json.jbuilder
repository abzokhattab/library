json.extract! user, :id
json.merge! user.attributes.except("_id")
json.link users_url(user, format: :json)