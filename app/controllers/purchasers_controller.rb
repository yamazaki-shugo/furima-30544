class PurchasersController < ApplicationController
  attr_accessor :token
  def index
    @item = Item.find(params[:item_id])
    @purchaser_card = PurchaserCard.new
  end

  def create
    @item = Item.find(params[:item_id])
    @purchaser_card = PurchaserCard.new(purchaser_params)
    if @purchaser_card.valid?
      pay_item
      @purchaser_card.save
      redirect_to root_path
    else  
      render 'index'
    end
  end

  private

  def purchaser_params
    params.require(:purchaser_card).permit(:postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: purchaser_params[:token],
        currency: 'jpy'
      )
  end
end
