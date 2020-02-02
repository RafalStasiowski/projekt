class OrderSerializer < ActiveModel::Serializer
  attributes  :id, :Status, :total,  :user_id, :created_at, :transaction_id, :pickup_time, :sub_total, :updated_at, :delivery_cost, :vat, :invoice
end