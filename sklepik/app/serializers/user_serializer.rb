class UserSerializer < ActiveModel::Serializer
  attributes  :email, :first_name, :last_name, :password,  :id, :role, :created_at, :updated_at
end