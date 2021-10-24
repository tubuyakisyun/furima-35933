class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :set_purchase, only: [:index, :create]
  before_action :set_purchase_address, only: [:index, :new]
  
  def index
    if current_user == @item.user
      redirect_to root_path
    elsif @item.purchase.present?
      redirect_to root_path
    end
  end

  def new
  end
  
  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path
    else
      render :index
    end
  #   item = Item.find(params[:item_id])
  #   @purchase = item.create_purchase!(user_id: current_user.id)
  #   @purchase.create_address!(address_params)
  #   redirect_to root_path
  end

  private

  # def purchase_params 
  #   params.merge(user_id: current_user.id, item_id: params[:item_id])
  # end 

  # def address_params
    # params.permit(:postal_code, :prefecture_id, :city, :house_number, :phone_number, :building_name).merge(purchase_id: @purchase.id)  
  # end

  def purchase_params
    params.require(:purchase_address).permit(:postal_code, :prefecture_id, :city, :house_number, :phone_number, :building_name).merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token])
  end

  def pay_item
      item = Item.find(params[:item_id])
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: item.price,  # 商品の値段
        card: purchase_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
  end

  def set_purchase
    @item = Item.find(params[:item_id])
  end

  def set_purchase_address
    @purchase_address = PurchaseAddress.new
  end

end
