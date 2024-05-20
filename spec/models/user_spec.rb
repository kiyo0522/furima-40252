require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nameとemail、passwordとpassword_confirmationが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが5文字以下では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordが半角英数字混合でない場合は登録できない' do
        @user.password = 'あaaaaaa'  # 英字のみ
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は半角英数字混合で入力してください')

        @user.password = 'あ111111'  # 数字のみ
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は半角英数字混合で入力してください')
      end

      it 'passwordとpassword_confirmationが一致しなければ登録できない' do
        @user.password = 'aaa000'
        @user.password_confirmation = 'aaa111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it '名字(全角)が空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it '名前(全角)が空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it '名字は、全角（漢字・ひらがな・カタカナ）での入力が必須です' do
        @user.first_name = 'taro'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name は全角で入力してください')
      end

      it '名前は、全角（漢字・ひらがな・カタカナ）での入力が必須です' do
        @user.last_name = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name は全角で入力してください')
      end

      it '名字カナ(全角)が空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end

      it '名前カナ(全角)が空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end

      it '名字カナは、全角（カタカナ）での入力が必須であること' do
        @user.last_name_kana = 'やまだ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana は全角カタカナで入力してください')
      end

      it '名前カナは、全角（カタカナ）での入力が必須であること' do
        @user.first_name_kana = 'たろう'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana は全角カタカナで入力してください')
      end

      it '生年月日が空では登録できない' do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end

# @user.password = 'ああああああ'  # 全角文字のみ 71〜
# @user.password_confirmation = @user.password
# @user.valid?
# expect(@user.errors.full_messages).to include('Password は半角英数字混合で入力してください')

# it 'passwordが半角英数字混合でない場合は登録できない' do　53〜
# @user.password = 'ああああ'
# @user.password_confirmation = @user.password
# @user.valid?
# expect(@user.errors.full_messages).to include('Password must include both letters and numbers')
# end