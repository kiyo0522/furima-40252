class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :authenticate_user!, only: [:index, :create] # ユーザーがログインしていることを確認
  before_action :redirect_if_seller, only: [:index, :create]
  before_action :redirect_if_sold, only: [:index, :create]

  def index
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
    # @item = Item.find(params[:item_id])
    @order_form = OrderForm.new
  end

  def create
    # binding.pry
    @order_form = OrderForm.new(order_params)
    if @order_form.valid?
      pay_item
      @order_form.save
      redirect_to root_path
    else
      gon.public_key = ENV['PAYJP_PUBLIC_KEY']
      render :index, status: :unprocessable_entity
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def redirect_if_seller
    if current_user == @item.user
      redirect_to root_path, alert: '自分の商品は購入できません'
    end
  end

  def redirect_if_sold
    if @item.order.present?
      redirect_to root_path, alert: 'この商品は既に売却されています'
    end
  end

  def order_params
    params.require(:order_form).permit(
      :post_code, :prefecture_id, :city, :block, :building, :phone
    ).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY'] # 自身のPAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price, # 商品の値段
      card: order_params[:token], # カードトークン
      currency: 'jpy' # 通貨の種類（日本円）
    )
  end
end

    # params.require(:order_form).permit(:post_code, :prefecture_id, :city, :block, :building,
    # :phone, :number, :exp_month, :exp_year, :cvc, :token).merge(user_id: current_user.id, item_id: params[:item_id])
    # params.require(:order_form).permit(:post_code, :prefecture_id, :city, :block, :building,
    # :phone, :order).merge(user_id: current_user.id, item_id:params[:item_id])
    # params.require(:order_form).permit(:post_code, :prefecture_id, :city, :block, :building,
    # :phone, :order, :token).merge(user_id: current_user.id, item_id: params[:item_id])
    # params.require(:order_form).permit(:post_code, :prefecture_id, :city, :block, :building,
    # :phone, :order, :token),merge(user_id: current_user.id,item_id: params[:item_id])
