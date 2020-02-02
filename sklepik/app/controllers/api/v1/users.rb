module API
  module V1
    class Users < Grape::API


      version 'v1', using: :path
      format :json
      prefix :api

        params do
          requires :email, type: String
          requires :password, type: String
          requires :first_name, type: String
          requires :last_name, type: String

        end

        post do
          User.create!({email: params[:email],
                        password:  params[:password],
                          first_name:  params[:first_name],
                       last_name: params[:last_name] })
        end
      resources :users do
        desc 'Return list of users'
        get do
       User.all

        end
      end
      desc 'return specific user'
      route_param :id do
        get do
          User.find(params[:id])
        end
      end

      desc 'update a specific user'
      route_param :id do
        put do
          User.find(params[:id]).update({email: params[:email],
                                         password:  params[:password],
                                         first_name:  params[:first_name],
                                         last_name: params[:last_name] })
        end
      end
      desc 'Delete an user'
      route_param :id do
        delete do
          User = User.find(params[:id])
          User.destroy
        end
      end
  end
  end
  end
