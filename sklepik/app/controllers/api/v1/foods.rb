module API
  module V1
    class Foods < Grape::API
      include API::V1::Defaults
      resource :foods do
        desc "Return all foods"
        get "" do
          Food.all
        end
        desc "Return a food"
        params do
          requires :id, type: String, desc: "ID of the food"
        end
        get ":id" do
          Food.where(id: permitted_params[:id]).first!
        end
      end
    end
  end
end