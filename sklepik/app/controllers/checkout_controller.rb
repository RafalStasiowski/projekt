class CheckoutController < ApplicationController
  protect_from_forgery :except => [:create]
  def show
    if logged_in?
      @current_order.ordered_items = session[:order]["items"]
    else
      redirect_to login_path
    end
  end

  def create

      @current_order.update_order(session[:order], order_params)
      if @current_order.save_order(@current_user)
        session[:order] = {}
        session[:cart] = {}
        flash[:success] = "Your order has been successfully placed."

        redirect_to root_path
      else
        flash[:error] = "An error occured while saving your order. Please try again."
        redirect_to root_path

    end
  end
  private

  def order_params
    { :invoice => params[:invoice], :status => params[:payment_status], :transaction_id => params[:txn_id]}
  end

end
