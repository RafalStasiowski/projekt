class OrdersController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @orders = @user.orders
  end

  def new
    @user= User.find(params[:user_id])
    @order= Order.new
  end

  def show
  end

  def create
    @user= User.find(params[:user_id])
    @order= Order.create(order_params)

  end

  def edit
  end

  def update
  end

  def delete
  end

  private
  def order_params
    params.require(:order).permit(:id, :user_id, :total, :vat,:delivery_cost,:created_at,  :updated_at, :transaction_id, :invoice, :pickup_time, :Status)
  end

end
