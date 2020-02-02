class OrderItemSerializer < ActiveModel::Serializer
  attributes  :id, :quantity, :food_id, :order_id
end