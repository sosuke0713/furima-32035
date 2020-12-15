require 'rails_helper'

 RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do

    context "新規登録がうまくいく"
      it "全部正常に入力されれば登録できる" do
         expect(@user).to be_valid
      end
    end
   
    context '新規登録がうまくいかない'do
     it "nicknameが空だと登録できない" do
      @user.nickname = ""  # nicknameの値を空にする
      @user.valid?
      expect(@user.errors.full_messages).to include ("Nickname can't be blank")
     end

     it "emailが@なしでは登録できない" do
      @user.email = "aaa.com"  
      @user.valid?
      expect(@user.errors.full_messages).to include ("Email is invalid")
     end

     it "emailが空では登録できない" do
      @user.email = ""  
      @user.valid?
      expect(@user.errors.full_messages).to include ("Email can't be blank")
     end

     it "重複したemailが存在する場合登録できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

     it "password:半角英数混合（半角英語のみ）以外だと登録できない" do
      @user.password = "ああああああ"  
      @user.valid?
      expect(@user.errors.full_messages).to include("Password には半角英字と半角数字の両方を含めて設定してください")
     end

     it "passwordが空では登録できないこと" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it "passwordが数字のみでは登録できないこと" do
        @user.password = "111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には半角英字と半角数字の両方を含めて設定してください")
        end

        it "passwordが英字のみでは登録できないこと" do
          @user.password = "aaaaaa"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password には半角英字と半角数字の両方を含めて設定してください")
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
        expect(@user.errors.full_messages).to include ("Familyname can't be blank")
       end

     it "familynameは全角（漢字・ひらがな・カタカナ）でなければ登録できない" do
      @user.familyname = "aaa"  
      @user.valid?
      expect(@user.errors.full_messages).to include ("Familyname is invalid. Input full-width characters.")
     end

     it "family_huriganaは空では登録できない" do
      @user.family_hurigana = ""  # family_huriganaの値を空にする
      @user.valid?
      expect(@user.errors.full_messages).to include ("Family hurigana can't be blank")
     end

     it "family_huriganaは全角（カタカナ）でなければ登録できない" do
      @user.family_hurigana = "aaa"  # 
      @user.valid?
      expect(@user.errors.full_messages).to include ("Family hurigana is invalid. Input full-width katakana characters.")
     end

     it "firstnameは全角（漢字・ひらがな・カタカナ）でなければ登録できない" do
      @user.firstname = "bbb"  
      @user.valid?
      expect(@user.errors.full_messages).to include ("Firstname is invalid. Input full-width characters.")
     end

     it "firstnameが空では登録できない" do
      @user.firstname = ""  # firstnameの値を空にする
      @user.valid?
      expect(@user.errors.full_messages).to include ("Firstname can't be blank")
     end

     it "first_huriganaは全角（カタカナ）でなければ登録できない" do
      @user.first_hurigana = "bbb"  
      @user.valid?
      expect(@user.errors.full_messages).to include ("First hurigana is invalid. Input full-width katakana characters.")
     end

     it "birthが空では登録できない" do
      @user.birth = ""  # birthの値を空にする
      @user.valid?
      expect(@user.errors.full_messages).to include ("Birth can't be blank")
     end
   end
 end
end
