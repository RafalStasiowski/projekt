class PaymentsController < ApplicationController

  skip_before_action :verify_authenticity_token

  def create
    if @current_order.save_order(@current_user)
      flash[:success] = "Your order has been successfully placed."
      # Here, we'd redirect to stripe page
      @ordered_foods = 0
      redirect_to root_path
    else
      flash[:error] = "An error occured while saving your order. Please try again."
    end
  end
end