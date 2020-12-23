class BuyersController < ApplicationController

  before_action :set_item, only: [:index, :create]
  before_action :authenticate_user!, only: [:index]

  def index
      if @item.user == current_user || @item.user != current_user && @item.buyer.present?
        redirect_to root_path
      end
    @item_form = OrderTag.new
  end

  def create
    @item_form = OrderTag.new(buyer_params)
    if @item_form.valid? 
       pay_item
       @item_form.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def buyer_params
    params.require(:order_tag).permit(:post_code, :state_id, :city, :house_number, :building_name, :phone_number, :buyer_id).merge(user_id: current_user.id, item_id: @item.id, token: params[:token]) 
  end

  def pay_item

    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: buyer_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

end
