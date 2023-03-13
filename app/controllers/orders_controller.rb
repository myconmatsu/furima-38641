class OrdersController < ApplicationController

  before_action :authenticate_user!
  before_action :item_set, only: [:index,:create]



  def index
    @order_buyer = OrderBuyer.new
    if current_user.id == @item.user_id || @item.order != nil
      redirect_to root_path
    end
  end

  def create
    @order_buyer = OrderBuyer.new(order_params)
    if @order_buyer.valid?
      pay_item
      @order_buyer.save
      redirect_to root_path
    else
      render :index
    end
  end


  private

  def order_params
    params.require(:order_buyer).permit(:post_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: @item.id,token: params[:token])
  end

  def item_set
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
        amount: @item.item_price,
        card: order_params[:token],    
        currency: 'jpy'                 
      )
  end

end