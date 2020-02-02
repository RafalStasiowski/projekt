module API
  module V3
    class Orders < Grape::API
      version 'v3', using: :path
      format :json
      prefix :api

      params do

                 requires    :Status, type: String
                             requires  :total, type: Integer
                                       requires  :vat, type: Integer
                                                 requires :delivery_cost, type: Integer
        requires  :user_id,type:Integer
        requires :transaction_id, type: String
        requires  :invoice, type: String
        requires  :pickup_time, type: Integer
                 requires :created_at, type: DateTime
                 requires :updated_at, type: DateTime




      end
      post do
        Order.create!({Status: params[:Status],
                       total:  params[:total],
                       vat:  params[:vat],
                       delivery_cost: params[:delivery_cost],
                       user_id: params[:user_id],
                       created_at: params[:created_at],
                       updated_at: params[:updated_at],
                       transaction_id: params[:transaction_id],
                       invoice: params[:invoice],
                       pickup_time: params[:pickup_time]})
      end
      resources :orders do
        desc 'Return list of orders'
        get do
          Order.all
        end
      end
      desc 'return specific Order'
      route_param :id do
        get do
          Order.find(params[:id])
        end
      end

      desc 'update a specific Order'
      route_param :id do
        put do
          Order.find(params[:id]).update({status: params[:status],
                                          total:  params[:total],
                                          vat:  params[:vat],
                                          delivery_cost: params[:delivery_cost],
                                          sub_total: params[:sub_total],
                                          user_id: params[:user_id],
                                          created_at: params[:created_at],
                                          updated_at: params[:updated_at],
                                          transaction_id: params[:transaction_id],
                                          invoice: params[:invoice],
                                          pickup_time: params[:pickup_time]})
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
