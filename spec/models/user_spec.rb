require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it 'nicknameとemail、passwordとpassword_confirmation、birth_date,first_nameとlast_naem,first_name_kanaとlast_name_kanaが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上であれば登録できる' do
        @user.password = '1111Aa'
        @user.password_confirmation = '1111Aa'
        expect(@user).to be_valid
      end
      it 'passwordが、半角英数字混合での入力であれば登録できる' do
        @user.password = 'AA22bb'
        @user.password_confirmation = 'AA22bb'
        expect(@user).to be_valid
      end
      it 'お名前（全角）は全角（漢字・ひらがな・カタカナ）での入力すれば登録できる' do
        @user.first_name = 'あな'
        @user.last_name = 'モリタ'
        @user.first_name = 'はな'
        @user.last_name = '森田'
        expect(@user).to be_valid
      end
      it 'お名前カナ（全角）は全角（カタカナ）での入力すれば登録できる' do
        @user.first_name_kana = 'カナ'
        @user.last_name_kana = 'カタ'
        expect(@user).to be_valid
      end

    end
    context '新規登録できない場合' do
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
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'password_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'birth_dateが空では登録できない' do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it 'passwordが5文字以下であれば登録できない' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'メールアドレスは＠がないと登録できない' do
        @user.email = 'furima'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが、半角英数字混合での入力でなければ登録できない' do
        @user.password = 'qqqqqqq'
        @user.password_confirmation = 'qqqqqqq'
        @user.valid?
        expect(@user.errors.full_messages).to include(["Password is invalid. Input half-width alphanumeric.", "Password confirmation is invalid. Input half-width alphanumeric."])
      end
      it 'passwordが、半角英数字混合での入力でなければ登録できない' do
        @user.password = '444444'
        @user.password_confirmation = '444444'
        @user.valid?
        expect(@user.errors.full_messages).to include(["Password is invalid. Input half-width alphanumeric.", "Password confirmation is invalid. Input half-width alphanumeric."])
      end
      it 'お名前（全角）は全角（漢字・ひらがな・カタカナ）での入力しないと登録できない' do
        @user.first_name = 'nana'
        @user.last_name = 'nana12'
        @user.first_name = 'Dr'
        @user.last_name = 'FDRT'
        @user.valid?
        expect(@user.errors.full_messages).to include(["Last name is invalid. Input full-width characters.", "First name is invalid. Input full-width characters."])
      end
      it 'お名前カナ（全角）は全角（カタカナ）での入力しないと登録できない' do
        @user.first_name_kana = '加奈'
        @user.last_name_kana = '加奈'
        @user.first_name_kana = 'abc'
        @user.last_name_kana = 'abc'
        @user.first_name_kana = '23'
        @user.last_name_kana = '23'
        @user.valid?
        expect(@user.errors.full_messages).to include(["Last name kana is invalid. Input full-width katakana characters.", "First name kana is invalid. Input full-width katakana characters."])
      end
    end
  end
end
