require 'rails_helper'

RSpec.describe OrderTag, type: :model do
  describe '購入情報の保存' do
    before do
      @item_form = FactoryBot.build(:order_tag)
    end
    context '購入ができる場合' do
      it '必要な情報を適切に入力すると、商品の購入ができること' do
        expect(@item_form).to be_valid
      end
      it '建物名が空白でも商品の購入ができること' do
        @item_form.building_name = nil
        expect(@item_form).to be_valid
      end
    end

    context '購入ができない場合' do
      it '出品者が空であるとき' do
        @item_form.user_id = nil
        @item_form.valid?
        expect(@item_form.errors.full_messages).to include("User can't be blank")
      end
      it '商品名が空であるとき' do
        @item_form.item_id = nil
        @item_form.valid?
        expect(@item_form.errors.full_messages).to include("Item can't be blank")
      end
        it '郵便番号が空であるとき' do
        @item_form.post_code = nil
        @item_form.valid?
        expect(@item_form.errors.full_messages).to include("Post code can't be blank")
      end
      it '郵便番号にハイフンがないとき' do
        @item_form.post_code = 4328021
        @item_form.valid?
        expect(@item_form.errors.full_messages).to include("Post code code Input correctly")
      end
      it '都道府県が空であるとき' do
        @item_form.state_id = 0
        @item_form.valid?
        expect(@item_form.errors.full_messages).to include("State Select")
      end
      it '市区町村が空であるとき' do
        @item_form.city = nil
        @item_form.valid?
        expect(@item_form.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空であるとき' do
        @item_form.house_number = nil
        @item_form.valid?
        expect(@item_form.errors.full_messages).to include("House number can't be blank")
      end
      it '電話番号が空であるとき' do
        @item_form.phone_number = nil
        @item_form.valid?
        expect(@item_form.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号にハイフンがあるとき' do
        @item_form.phone_number = "090-1000-2000"
        @item_form.valid?
        expect(@item_form.errors.full_messages).to include("Phone number number Input only number")
      end
      it '電話番号が12桁以上であるとき' do
        @item_form.phone_number = "090123456789"
        @item_form.valid?
        expect(@item_form.errors.full_messages).to include("Phone number number Input only number")
      end
      it '電話番号に数字以外があるとき' do
        @item_form.phone_number = "090-abcd-2000"
        @item_form.valid?
        expect(@item_form.errors.full_messages).to include("Phone number number Input only number")
      end
      it 'tokenが空であるとき' do
        @item_form.token = nil
        @item_form.valid?
        expect(@item_form.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
