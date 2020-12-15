require 'rails_helper'

 RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

   describe 'ユーザー新規登録' do
     "全部正常に入力されれば登録できる"

     it "nicknameが空だと登録できない" do
      @user.nickname = ""  # nicknameの値を空にする
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
     end

     it "emailが空では登録できない" do
      @user.email = ""  # emailの値を空にする
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
     end

     it "password:半角英数混合（半角英語のみ）" do
      @user.password = "aaaaaaa"  
      @user.valid?
      # binding.pry
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
     end

     it "passwordが空では登録できないこと" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
      end

    it "passwordが6文字以上であれば登録できること" do
      @user.password = "aaaa123456"
      @user.password_confirmation = "aaaa123456"
      expect(@user).to be_valid
      end

    it "passwordが5文字以下であれば登録できないこと" do
      @user.password = "a1234"
      @user.password_confirmation = "a1234"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

    it "passwordとpassword_confirmationが不一致では登録できないこと" do
      @user.password = "1234aaa"
      @user.password_confirmation = "12345aaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

     it "familynameが空では登録できない" do
      @user.familyname = ""  # familynameの値を空にする
      @user.valid?
      expect(@user.errors.full_messages).to include "Familyname can't be blank"
     end

     it "family_huriganaが空では登録できない" do
      @user.family_hurigana = ""  # family_huriganaの値を空にする
      @user.valid?
      expect(@user.errors.full_messages).to include "Family hurigana can't be blank"
     end

     it "firstnameが空では登録できない" do
      @user.firstname = ""  # firstnameの値を空にする
      @user.valid?
      expect(@user.errors.full_messages).to include "Firstname can't be blank"
     end

     it "first_huriganaが空では登録できない" do
      @user.first_hurigana = ""  # first_huriganaの値を空にする
      @user.valid?
      expect(@user.errors.full_messages).to include "First hurigana can't be blank"
     end

     it "birthが空では登録できない" do
      @user.birth = ""  # birthの値を空にする
      @user.valid?
      expect(@user.errors.full_messages).to include "Birth can't be blank"
     end
   end
 end

