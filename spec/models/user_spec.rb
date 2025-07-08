require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it "nickname、email、password、last_name、first_name、birthdayが存在すれば登録できる" do
        
      end
    end

    context '新規登録できない場合' do
      it "nicknameが空では登録できない" do
        
      end
      it "emailが空では登録できない" do
        
      end
      it "passwordが空では登録できない" do
        
      end
      it "last_nameが空では登録できない" do
        
      end
      it "first_nameが空では登録できない" do
        
      end
      it "birthdayが空では登録できない" do
        
      end
    end
  end

end
