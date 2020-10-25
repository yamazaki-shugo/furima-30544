class PurchasersController < ApplicationController
  before_action :item_find, only: [:index, :create]
  before_action :move_to_root, only: :index
  before_action :authenticate_user!, only: :index
  def index
    @purchaser_card = PurchaserCard.new
  end

  def create
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
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: purchaser_params[:token],
      currency: 'jpy'
    )
  end

  def item_find
    @item = Item.find(params[:item_id])
  end

  def move_to_root
    redirect_to root_path if (user_signed_in? && current_user.id == @item.user.id) || @item.purchaser.present?
  end
end
