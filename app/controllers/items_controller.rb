class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
    @items = Item.includes(:user).order(created_at: :desc) # 新着順にソート
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to '/'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
    # @item.destroy
    # redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(
      :title,
      :title_description,
      :category_id,
      :condition_id,
      :shipp_fee_id,
      :prefecture_id,
      :shipp_date_id,
      :image,
      :price
    ).merge(user_id: current_user.id)
  end
end
