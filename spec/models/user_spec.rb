require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  before do
    @user = FactoryBot.build(:user)
  end

  describe '新規登録/ユーザー情報' do
    context '新規登録がうまくいかないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end

      it 'emailが空だと登録できない' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it '重複したemailがある場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include 'Email has already been taken'
      end

      it 'emailに@がないと登録できない' do
        @user.email = 'testcom'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Email is invalid'
      end

      it 'passwordが空だと登録できない' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234576'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end

      it 'first_nameがない場合は登録できないこと' do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end

      it 'last_nameがない場合は登録できないこと' do
        @user.last_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank"
      end

      it "first_nameは漢字・平仮名・カタカナ以外では登録できない" do
        @user.first_name = "test"
        @user.valid?
        expect(@user.errors.full_messages).to include "First name is invalid"
      end

      it "last_nameは漢字・平仮名・カタカナ以外では登録できない" do
        @user.last_name = "test"
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name is invalid"
      end
  
      it 'first_name_kanaがない場合は登録できない' do
        @user.first_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana can't be blank"
      end
  
      it 'last_name_kanaがない場合は登録できない' do
        @user.last_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana can't be blank"
      end
  
      it "first_name_kanaは全角カタカナ以外では登録できない" do
      binding.pry
        @user.first_name_kana = "てすと"
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana is invalid"
      end
      
      it "last_name_kanaは全角カタカナ以外では登録できない" do
        binding.pry
          @user.last_name_kana = "てすと"
          @user.valid?
          expect(@user.errors.full_messages).to include "Last name kana is invalid"
        end

      it 'birthdayがない場合は登録できない' do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end
    end

    context '新規登録がうまくいくとき' do
      it 'passwordが6文字以上であれば登録できる' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        expect(@user).to be_valid
      end

      it 'passwordは半角英数混同であれば登録できる' do
        @user.password = 'aaa111'
        @user.password_confirmation = 'aaa111'
        expect(@user).to be_valid
      end

      it "first_nameは全角であれば登録できる" do
        @user.first_name = "全角"
        expect(@user).to be_valid
      end

      it "last_nameは全角であれば登録できる" do
        @user.last_name = "てすと"
        expect(@user).to be_valid
      end

      it "first_kanaが全角カナ文字であれば登録できる" do
        @user.last_name = "テスト"
        expect(@user).to be_valid
      end
    end
  end
end
