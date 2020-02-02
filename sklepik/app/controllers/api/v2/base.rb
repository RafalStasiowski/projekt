module API
  module V2
    class Base < Grape::API
      mount API::V2::OrderItems


    end
  end
end