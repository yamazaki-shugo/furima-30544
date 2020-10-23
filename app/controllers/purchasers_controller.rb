class PurchasersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @purchaser_card = PurchaserCard.new
  end

  def create
    @purchaser_card = PurchaserCard.new(purchaser_params)
    if @purchaser_card.valid?
      @purchaser_card.save
      redirect_to root_path
    else  
      render action: :index
    end
  end

  private

  def purchaser_params
    params.require(:purchaser_card).permit(:postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
