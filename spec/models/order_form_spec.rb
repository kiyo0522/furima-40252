require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_form = FactoryBot.build(:order_form, user_id: user.id, item_id: item.id)
  end

  describe '商品購入機能の保存' do
    context '購入登録できるとき' do
      it '全ての属性が正しく入力されていれば登録できる' do
        expect(@order_form).to be_valid
      end

      it '建物名は空でも登録できる' do
        @order_form.building = ''
        expect(@order_form).to be_valid
      end
    end

    context '購入登録できないとき' do
      it 'user_idが空では登録できない' do
        @order_form.user_id = nil # user_id を nil にする
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

      it '郵便番号が空では登録できない' do
        @order_form. post_code = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Post code can't be blank")
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

      it '電話番号が空では登録できない' do
        @order_form.phone = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone can't be blank")
      end

      it '電話番号が12桁以上だと登録できない' do
        @order_form.phone = '090123456789'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Phone は10桁以上11桁以内の半角数値で入力してください')
      end

      it '電話番号にハイフンが含まれていると登録できない' do
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

# 学習用とし記録しております
# it '建物名は空でも登録できる' ＃ は正常系で記述すること
#   @order_form.building = ''
#   expect(@order_form).to be_valid
# end

# 学習用とし記録しております
# 保存してからIDを付与するためbuildでは保存されないためcreateで保存してから取得する
# 今回インスタンスで使用しないため＠は使用しない(使用することもできるが今回は必要がないため)
# undefined local variable or method `user' fo名前不一致のエラー@user.idを使用するならば、＠user.idを使用するべき
  
# before do
#   user = FactoryBot.build(:user)
#   item = FactoryBot.build(:item)
#   @order_form = FactoryBot.build(:order_form, user_id: user.id, item_id: item.id)
# end

# before do	before do
#   @user = FactoryBot.create(:user)
#   @item = FactoryBot.create(:item)
#   @order_form = FactoryBot.build(:order_form, user: @user, item: @item)
# end

# 学習用（テスト毎に分けること！）
# it '電話番号が11桁を超えまたはハイフンがあると登録できない' do
#   @order_form.phone = '090123456789'
#   @order_form.valid?
#   expect(@order_form.errors.full_messages).to include('Phone は10桁以上11桁以内の半角数値で入力してください')
#   @order_form.phone = '090-1234-5678'
#   @order_form.valid?
#   expect(@order_form.errors.full_messages).to include('Phone は10桁以上11桁以内の半角数値で入力してください')
# end