require 'rails_helper'

RSpec.describe ProductAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    sell = FactoryBot.create(:sell)
    @product_address = FactoryBot.build(:product_address, sell_id: sell.id, user_id: user.id)
    sleep(1)
  end
  describe '購入情報の入力' do
    context '購入がうまくいく時'
      it 'postal_code,shipping_area_id,municipality,address,phone_number,token,user_id,sell_idが存在すれば購入できる' do
        expect(@product_address).to be_valid
      end

      it 'building_nameは空でも登録できる' do
        @product_address.building_name = nil
        expect(@product_address).to be_valid
      end

    context '購入がうまくいかない時' do
      it 'postal_codeが空だと購入できない' do
        @product_address.postal_code = nil
        @product_address.valid?
        expect(@product_address.errors.full_messages).to include "Postal code can't be blank"
      end

      it 'postal_codeに-がないと購入できない' do
        @product_address.postal_code = '1234567'
        @product_address.valid?
        expect(@product_address.errors.full_messages).to include 'Postal code is invalid'
      end

      it 'shipping_area_idが空だと購入できない' do
        @product_address.shipping_area_id = nil
        @product_address.valid?
        expect(@product_address.errors.full_messages).to include "Shipping area can't be blank"
      end

      it "shipping_area_idiが1以外でないと購入できないこと" do
      binding.pry
        @product_address.shipping_area_id = 1
        @product_address.valid?
        expect(@product_address.errors.full_messages).to include "Shipping area must be other than 1"
      end

      it 'municipalityが空だと購入できない' do
        @product_address.municipality = nil
        @product_address.valid?
        expect(@product_address.errors.full_messages).to include "Municipality can't be blank"
      end

      it 'addressが空だと購入できない' do
        @product_address.address = nil
        @product_address.valid?
        expect(@product_address.errors.full_messages).to include "Address can't be blank"
      end

      it 'phone_numberが空だと購入できない' do
        @product_address.phone_number = nil
        @product_address.valid?
        expect(@product_address.errors.full_messages).to include "Phone number can't be blank"
      end

      it 'phone_numberに-があると購入できない' do
        @product_address.phone_number = '000-0000-0000'
        @product_address.valid?
        expect(@product_address.errors.full_messages).to include 'Phone number is invalid'
      end

      it 'phone_numberが11桁以上だと購入できない' do
        @product_address.phone_number = '000000000000'
        @product_address.valid?
        expect(@product_address.errors.full_messages).to include 'Phone number is invalid'
      end

      it "phone_numberが英数字混合だと購入できない" do 
      @product_address.phone_number = '000000000aaa'
      @product_address.valid?
      expect(@product_address.errors.full_messages).to include 'Phone number is invalid'
      end

      it 'tokenが空だと登録できない' do
        @product_address.token = nil
        @product_address.valid?
        expect(@product_address.errors.full_messages).to include "Token can't be blank"
      end

      it 'user_idが空だと登録できない' do
        @product_address.user_id = nil
        @product_address.valid?
        expect(@product_address.errors.full_messages).to include "User can't be blank"
      end

      it 'sell_idが空だと登録できない' do
        @product_address.sell_id = nil
        @product_address.valid?
        expect(@product_address.errors.full_messages).to include "Sell can't be blank"
      end
    end
  end
end
