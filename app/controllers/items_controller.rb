class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def new
  @item = Item.new
  end

  private

  def item_params
    params.require(:item).permit(:name,:detail,:category_id,:condition_id,:delivery_charge_id,:prefecture_id,:shopping_date_id,:price,:image).merge(user_id: current_user.id)
  end

end