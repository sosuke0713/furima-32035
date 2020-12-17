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

    it "imageがないと出品できない" do
      @item.image = nil #""ではだめ
      @item.valid?
      expect(@item.errors.full_messages).to include ("Image can't be blank")
     end

     it "titleが空だと出品できない" do
      @item.title = "" 
      @item.valid?
      expect(@item.errors.full_messages).to include ("Title can't be blank")
     end

     it "priceが空では出品できない" do
      @item.price = nil #""でも可
      @item.valid?
      expect(@item.errors.full_messages).to include ("Price can't be blank")
     end

     it "priceが299円以下だと出品できない。" do
      @item.price = "299"  
      @item.valid?
      expect(@item.errors.full_messages).to include ("Price is out of setting range")
     end

     it "priceが100,000,000円以上だと出品できない。" do
      @item.price = "10000000"  
      @item.valid?
      expect(@item.errors.full_messages).to include ("Price is out of setting range")
     end

     it "priceが半角数字でなければ出品できない" do
      @item.price = "kkkk"  
      @item.valid?
      expect(@item.errors.full_messages).to include ("Price is out of setting range")
     end

     it "categoryに0が選ばれていると出品できない" do
      @item.category_id = "0"  
      @item.valid?
      expect(@item.errors.full_messages).to include ("Category must be other than 0")
     end

     it "statusに0が選ばれていると出品できない" do
      @item.status_id = "0"  
      @item.valid?
      expect(@item.errors.full_messages).to include ("Status must be other than 0")
     end

     it "deliveryfeeに0が選ばれていると出品できない" do
      @item.deliveryfee_id = "0"  
      @item.valid?
      expect(@item.errors.full_messages).to include ("Deliveryfee must be other than 0")
     end

     it "stateに0が選ばれていると出品できない" do
      @item.state_id = "0"  
      @item.valid?
      expect(@item.errors.full_messages).to include ("State must be other than 0")
     end

     it "shippingdateに0が選ばれていると出品できない" do
      @item.shippingdate_id = "0"  
      @item.valid?
      expect(@item.errors.full_messages).to include ("Shippingdate must be other than 0")
     end

     it "commentsが空では出品できない" do
      @item.comments = ""  
      @item.valid?
      expect(@item.errors.full_messages).to include ("Comments can't be blank")
     end
  end
end

