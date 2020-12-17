require 'rails_helper'

 RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do

    context "商品出品がうまくいく"
      it "全部正常に入力されれば出品できる" do
         expect(@item).to be_valid
      end
    end
   
    context '商品出品がうまくいかない'do
     it "titleが空だと出品できない" do
      @item.title = "" 
      @item.valid?
      expect(@item.errors.full_messages).to include ("Title can't be blank")
     end

     it "priceが空では出品できない" do
      @item.price = ""  
      @item.valid?
      expect(@item.errors.full_messages).to include ("Price can't be blank")
     end

     it "priceが¥300~¥9999999でなければ出品できない" do
      @item.price = "200"  
      @item.valid?
      expect(@item.errors.full_messages).to include ("Price is out of setting range")
     end

     it "priceが半角数字でなければ出品できない" do
      @item.price = "kkkk"  
      @item.valid?
      expect(@item.errors.full_messages).to include ("Price is out of setting range")
     end



     it "categoryが空では出品できない" do
      @item.category_id = ""  
      @item.valid?
      expect(@item.errors.full_messages).to include ("Category can't be blank")
     end

     it "statusが空では出品できない" do
      @item.status_id = ""  
      @item.valid?
      expect(@item.errors.full_messages).to include ("Status can't be blank")
     end

     it "deliveryfeeが空では出品できない" do
      @item.deliveryfee_id = ""  
      @item.valid?
      expect(@item.errors.full_messages).to include ("Deliveryfee can't be blank")
     end

     it "stateが空では出品できない" do
      @item.state_id = ""  
      @item.valid?
      expect(@item.errors.full_messages).to include ("State can't be blank")
     end

     it "shippingdateが空では出品できない" do
      @item.shippingdate_id = ""  
      @item.valid?
      expect(@item.errors.full_messages).to include ("Shippingdate can't be blank")
     end

     it "textが空では出品できない" do
      @item.comments = ""  
      @item.valid?
      expect(@item.errors.full_messages).to include ("Comments can't be blank")
     end
  end
end

