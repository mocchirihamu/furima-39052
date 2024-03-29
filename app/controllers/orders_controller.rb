class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :order_item, only: [:index, :create]

  def index
    if current_user.id != @item.user_id && @item.order.blank?
      @order_address = OrderAddress.new
    else
      redirect_to root_path
    end
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postcode, :prefecture_id, :city, :address1, :address2, :telephone, :order_id)
          .merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def order_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
