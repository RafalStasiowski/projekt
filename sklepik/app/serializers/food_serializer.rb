class FoodSerializer < ActiveModel::Serializer
  attributes  :name, :description, :price, :food_image_file_name, :status
end