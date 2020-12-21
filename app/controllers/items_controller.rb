class ItemsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :edit]
  before_action :set_item, only: [:show, :edit, :update]

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
    #@item = Item.find(params[:id])
  end

  def edit
    #@item = Item.find(params[:id])
    unless current_user.id == @item.user.id
      redirect_to root_path
    end
  end

  def update
    #@item = Item.find(params[:id])
    if @item.valid?
      if current_user.id == @item.user.id
        @item.update(items_params)
        redirect_to item_path
      end
    else
      render :edit
    end
  end


  private

  def items_params
    params.require(:item).permit(:image, :title, :comments, :category_id, :status_id, :deliveryfee_id, :state_id, :shippingdate_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
