class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]  # ログインしていることを確認
  before_action :contributor_confirmation, only: [:edit, :update] # 現在のユーザーとアイテム投稿者が一致していることを確認

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
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id]) # 編集したいレコードを取得
    if @item.update(item_params)# 取得したレコードをupdateメソッドで更新
      redirect_to item_path(@item)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    # @item = Item.find(params[:id]) 
    # if @item.destroy
    #   redirect_to root_path
    # else
    #   redirect_to root_path
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

  def contributor_confirmation
    @item = Item.find(params[:id])
    redirect_to root_path unless current_user == @item.user
  end
end
