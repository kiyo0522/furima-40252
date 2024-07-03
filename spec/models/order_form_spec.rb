require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    @order_form = FactoryBot.build(:order_form)
  end

  describe '商品購入機能の保存' do
    context '購入登録できるとき' do
      it '全ての属性が正しく入力されていれば登録できる' do
        expect(@order_form).to be_valid
      end
    end

    context '購入登録できないとき' do
      it 'user_idが空では登録できない' do
        @order_form.user_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空では登録できない' do
        @order_form.item_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Item can't be blank")
      end

      it '郵便番号が[3桁ハイフン4桁]以外は登録できない' do
        @order_form.post_code = '1234567'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end

      it '都道府県が1「---」、またはブランクでは登録できない' do
        @order_form.prefecture_id = 1
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '市区町村が空では登録できない' do
        @order_form.city = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("City can't be blank")
      end

      it '番地が空では登録できない' do
        @order_form.block = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Block can't be blank")
      end

      it '建物名は空でも登録できる' do
        @order_form.building = ''
        expect(@order_form).to be_valid
      end

      it '電話番号が11桁を超えまたはハイフンがあると登録できない' do
        @order_form.phone = '090123456789'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Phone は10桁以上11桁以内の半角数値で入力してください')
        @order_form.phone = '090-1234-5678'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Phone は10桁以上11桁以内の半角数値で入力してください')
      end

      it '電話番号が10桁以上でないと登録できない' do
        @order_form.phone = '090123456'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Phone は10桁以上11桁以内の半角数値で入力してください')
      end

      it 'tokenが空では登録できない' do
        @order_form.token = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
