class ItemsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(items_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    if user_signed_in? && @item.user == current_user
      render :edit
    elsif @item.user != current_user
      redirect_to root_path
    else
      redirect_to user_sessions_path
    end
  end



  def update
    if @item.valid?
      if current_user.id == @item.user.id
        @item.update(items_params)
        redirect_to item_path
      end
    else
      render :edit
    end
  end

  def destroy
    if current_user.id == @item.user.id
      @item.destroy
    end
    redirect_to root_path  #current_userと出品者が一致してもしなくても、いつでもリダイレクト
  end

  private

  def items_params
    params.require(:item).permit(:image, :title, :comments, :category_id, :status_id, :deliveryfee_id, :state_id, :shippingdate_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
