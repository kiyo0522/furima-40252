require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '出品登録' do
    context '出品登録できるとき' do
      it 'titleとtitle_description、category_idとcondition_id、
          shipp_fee_id、prefecture_id、shipp_date_id、priceが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '出品登録できないとき' do
      it 'item.userが空だとuserと紐づいていないため保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end

      it '画像が１枚ないと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名が空では登録できない' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end

      it '商品説明が空では登録できない' do
        @item.title_description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Title description can't be blank")
      end

      it 'カテゴリが空では登録できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it '商品状態が空では登録できない' do
        @item.condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end

      it '配送料負担が空では登録できない' do
        @item.shipp_fee_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipp fee can't be blank")
      end

      it '発送元地域が空では登録できない' do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '発送日の目安が空では登録できない' do
        @item.shipp_date_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipp date can't be blank")
      end

      it '価格が空では登録できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '価格が300円未満では登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price 価格 は300以上9999999以下の数字で入力してください')
      end

      it '価格が9999999円を超えると登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price 価格 は300以上9999999以下の数字で入力してください')
      end

      it '価格が半角数字でない場合は登録できない' do
        @item.price = 'aaaa'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price 価格 は300以上9999999以下の数字で入力してください')
      end

      it 'カテゴリが1「---」では登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it '商品状態が1「---」では登録できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end

      it '配送料負担が1「---」では登録できない' do
        @item.shipp_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipp fee can't be blank")
      end

      it '発送元地域が1「---」では登録できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '発送日の目安が1「---」では登録できない' do
        @item.shipp_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipp date can't be blank")
      end
    end
  end
end
