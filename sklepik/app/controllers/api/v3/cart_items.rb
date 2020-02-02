module API
  module V3
    class CartItems < Grape::API
      version 'v3', using: :path
      format :json
      prefix :api

      params do
        requires :id, type: Integer
        requires    :Status, type: String
        requires  :total, type: Integer
        requires  :user_id, type: Integer
        requires :pickup_time, type: Integer
        requires  :sub_total,type:Integer
        requires :order_details, type: String
        requires  :food_id,type:Integer
        requires :quantity, type:Integer


      end
      post do
        CartItem.create!({status: params[:status],
                       total:  params[:total],
                       user_id:  params[:user_id],
                       pickup_time: params[:pickup_time],
                       sub_total: params[:sub_total],
                       order_details: params[:order_details],
                       food_id: params[:food_id],
                       quantity: params[:quantity]})
      end
      resources :orders do
        desc 'Return list of orders'
        get do
          CartItem.all
        end
      end
      desc 'return specific Order'
      route_param :id do
        get do
          CartItem.find(params[:id])

        end
      end

      desc 'update a specific Order'
      route_param :id do
        put do
          Order.find(params[:id]).update({status: params[:status],
                                          total:  params[:total],
                                          user_id:  params[:user_id],
                                          pickup_time: params[:pickup_time],
                                          sub_total: params[:sub_total],
                                          order_details: params[:order_details],
                                          food_id: params[:food_id],
                                          quantity: params[:quantity]})
        end
      end
      desc 'Delete an order'
      route_param :id do
        delete do
          Order = Order.find(params[:id])
          Order.destroy
        end
      end
    end
  end
end
