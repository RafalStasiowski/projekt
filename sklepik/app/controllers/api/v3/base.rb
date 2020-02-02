module API
  module V3
    class Base < Grape::API
      mount API::V3::Orders
      mount API::V3::CartItems



    end
  end
end