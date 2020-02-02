module API
  module V2
    class OrderItems< Grape::API
      version 'v2', using: :path
      format :json
      prefix :api


      params do
        requires :quantity, type: Integer
        requires :food_id, type: Integer
        requires :order_id, type: Integer





      end
      post do
        OrderItem.create!({quantity: params[:quantity],
                            food_id:  params[:food_id]

                          })
      end
      resources :order_items do
        desc 'Return list of order items'
        get do
          OrderItem.all
        end
      end
      desc 'return specific user'
      route_param :order_id do
        get do
          OrderItem.all
        end
      end

      desc 'update a specific user'
      route_param :order_id do
        put do
          OrderItem.find(params[:order_id]).update({quantity: params[:quantity],
                                         oder_id:  params[:order_id],
                                         food_id:  params[:food_id]
                                        })
        end
      end
      desc 'Delete an orderitem'
      route_param :id do
        delete do
          OrderItem = OrderItem.find(params[:order_id])
          OrderItem.destroy
        end
      end
    end
  end
end