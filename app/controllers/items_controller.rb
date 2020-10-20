class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_index, only: :edit
  before_action :item_find, only: [:show, :edit, :update, :destroy]
  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :item_status_id, :burden_type_id, :prefecture_id, :days_to_ship_id, :price, :image).merge(user_id: current_user.id)
  end

  def item_find
    @item = Item.find(params[:id])
  end

  def move_to_index
    item_find
    redirect_to action: :index unless user_signed_in? && current_user.id == @item.user.id
  end
end
