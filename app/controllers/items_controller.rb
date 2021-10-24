class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :destroy]
  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def show
  end

  def edit
    if current_user != @item.user
      redirect_to root_path
    elsif @item.purchase.present?
      redirect_to root_path
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    redirect_to root_path if current_user == @item.user && @item.destroy
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :info, :price, :category_id, :prefecture_id, :status_id, :scheduled_id,
                                 :shipping_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
