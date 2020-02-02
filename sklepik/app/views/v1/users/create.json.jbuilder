json.data do
  json.user do

    json.email @user.email
    json.password @user.password
    json.first_name @user.first_name
    json.last_name @user.last_name



  end
end