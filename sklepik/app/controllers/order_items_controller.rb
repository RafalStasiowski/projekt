class OrderItemsController < ApplicationController
  def index
    @order_items= OrderItem.all
  end
  def new
    @order_item = OrderItem.new
    end

  def create
    @order_item= OrderItem.create(order_item_params)
    end

  private
  def order_item_params
    params.require(:order_items) .permit(:quantity, :food_id, :user_id)

  end
  end