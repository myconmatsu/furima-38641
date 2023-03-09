class OrdersController < ApplicationController

  before_action :authenticate_user!

  def index
    @item = Item.find(params[:item_id])
    @order_buyer = OrderBuyer.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_buyer = OrderBuyer.new(order_params)
    if @order_buyer.valid?
      @order_buyer.save
      redirect_to root_path
    else
      render :index
    end
  end
end

  private

  def order_params
    params.require(:order_buyer).permit(:post_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: @item.id)
  end
