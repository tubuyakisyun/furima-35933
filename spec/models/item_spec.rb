require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品できる場合' do
      it '必要な情報を適切に入力して「出品する」ボタンを押すと、商品情報がデータベースに保存されること' do
        expect(@item).to be_valid
      end
      it '商品名が必須であること' do
        @item.name = 'aaa'
        expect(@item).to be_valid
      end
      it '商品の説明が必須であること' do
        @item.info = 'abba'
        expect(@item).to be_valid
      end
      it 'カテゴリーの情報が必須であること' do
        @item.category_id = '2'
        expect(@item).to be_valid
      end
      it '商品の状態の情報が必須であること' do
        @item.status_id = '2'
        expect(@item).to be_valid
      end
      it '配送料の負担の情報が必須であること' do
        @item.shipping_id = '2'
        expect(@item).to be_valid
      end
      it '発送元の地域の情報が必須であること' do
        @item.prefecture_id = '2'
        expect(@item).to be_valid
      end
      it '発送までの日数の情報が必須であること' do
        @item.scheduled_id = '2'
        expect(@item).to be_valid
      end
      it '価格の情報が必須であること' do
        @item.price = '7000'
        expect(@item).to be_valid
      end
      it '価格は、¥300~¥9,999,999の間のみ保存可能であること' do
        @item.price = '99999'
        expect(@item).to be_valid
      end
      it '価格は、¥300で保存可能であること' do
        @item.price = '300'
        expect(@item).to be_valid
      end
      it '価格は、¥9,999,999で保存可能であること' do
        @item.price = '9999999'
        expect(@item).to be_valid
      end
    end
    context '商品出品できない場合' do
      it '商品名が空だと出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include{"Name can't be blank"}
      end
      it '商品の説明が空だと出品できない' do
        @item.info = ''
        @item.valid?
        expect(@item.errors.full_messages).to include{"Info can't be blank"}
      end
      it '価格が空だと出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include{"Price can't be blank"}
      end
      it '価格は、¥300以下だと保存できないこと' do
        @item.price = '222'
        @item.valid?
        expect(@item.errors.full_messages).to include{"Price Out of setting range"}
      end
      it '価格は、¥9,999,999以上だと保存できないこと' do
        @item.price = '22222222222'
        @item.valid?
        expect(@item.errors.full_messages).to include{"Price Out of setting range"}
      end
      it '価格は半角数値ではないと保存できないこと' do
        @item.price = '９９９９９'
        @item.valid?
        expect(@item.errors.full_messages).to include{"Price Half-width number"}
      end
      it '写真が付かないと出品できない' do
        @item.image.key = ''
        @item.valid?
        expect(@item.errors.full_messages).to include{"Image can't be blank"}
      end
      it 'カテゴリーが空だと出品できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include{"Category can't be blank"}
      end
      it '商品の状態の情報が空だと出品できない' do
        @item.status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include{"Sales can't be blank"}
      end
      it '配送料の負担の情報が空だと出品できない' do
        @item.shipping_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include{"Shipping can't be blank"}
      end
      it '発送元の地域の情報が空だと出品できない' do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include{"Prefecture can't be blank"}
      end
      it '発送までの日数の情報が空だと出品できない' do
        @item.scheduled_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include{"Scheduled can't be blank"}
      end
    end
  end
end
