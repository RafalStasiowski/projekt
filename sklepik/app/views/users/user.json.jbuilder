json.extract! user, :email, :first_name, :last_name, :password,  :id, :role
json.url user_url(user, format: :json)
