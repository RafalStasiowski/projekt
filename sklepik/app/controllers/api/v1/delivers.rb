module API
  module V1
    class Delivers < Grape::API
      include API::V1::Defaults
      resource :delivers do
        desc "Return all delivers"
        get "" do
          Deliver.all
        end
        desc "Return a deliver"
        params do
          requires :id, type: String, desc: "ID of the deliver"
        end
        get ":id" do
          Deliver.where(id: permitted_params[:id]).first!
        end
      end
    end
  end
end