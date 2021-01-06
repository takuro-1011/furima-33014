require 'rails_helper'

RSpec.describe Sell, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  before do
    @sell = FactoryBot.build(:sell)
  end
  describe '商品情報の入力' do
    context '出品がうまくいく時' do
      it 'product_name,product_description,image,price,category_id,product_condition_id,delivery_fee_id,shipping_area_id,day_idが存在すれば登録できる' do
        expect(@sell).to be_valid
      end
    end

    context '出品がうまくいかない時' do
      it 'imageが空だと出品できない' do
        @sell.image = nil
        @sell.valid?
        expect(@sell.errors.full_messages).to include "Image can't be blank"
      end

      it 'product_nameが空だと出品できない' do
        @sell.product_name = nil
        @sell.valid?
        expect(@sell.errors.full_messages).to include "Product name can't be blank"
      end

      it 'product_descriptionが空だと出品できない' do
        @sell.product_description = nil
        @sell.valid?
        expect(@sell.errors.full_messages).to include "Product description can't be blank"
      end

      it 'category_idが空だと出品できない' do
        @sell.category_id = nil
        @sell.valid?
        expect(@sell.errors.full_messages).to include 'Category is not a number'
      end

      it 'product_condition_idが空だと出品できない' do
        @sell.product_condition_id = nil
        @sell.valid?
        expect(@sell.errors.full_messages).to include 'Product condition is not a number'
      end

      it 'delivery_fee_idが空だと出品できない' do
        @sell.delivery_fee_id = nil
        @sell.valid?
        expect(@sell.errors.full_messages).to include 'Delivery fee is not a number'
      end

      it 'day_idが空だと出品できない' do
        @sell.day_id = nil
        @sell.valid?
        expect(@sell.errors.full_messages).to include 'Day is not a number'
      end

      it 'priceが空だと出品できない' do
        @sell.price = nil
        @sell.valid?
        expect(@sell.errors.full_messages).to include "Price can't be blank"
      end

      it 'priceが全角数字だと登録できない' do
        @sell.price = '１１１１'
        @sell.valid?
        expect(@sell.errors.full_messages).to include 'Price is not a number'
      end

      it 'priceが¥300以下だと出品できない' do
        @sell.price = '299'
        @sell.valid?
        expect(@sell.errors.full_messages).to include 'Price must be greater than or equal to 300'
      end
      it 'priceが¥9,999,999以上だと出品できない' do
        @sell.price = '10000000'
        @sell.valid?
        expect(@sell.errors.full_messages).to include 'Price must be less than or equal to 9999999'
      end
    end
  end
end
