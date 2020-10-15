require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nickname, email, password, first_name_zen, last_name_zen, first_name_kana, last_name_kana, birth_dayが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "passwordが6文字以上で英字と数字の両方を含んでいれば登録できる" do
        @user.password = "s12345"
        @user.password_confirmation = "s12345"
        expect(@user).to be_valid
      end
      it "first_name_zen, last_name_zenが全角かなであれば登録できる" do
        @user.first_name_zen = "山田"
        @user.last_name_zen = "四郎"
        expect(@user).to be_valid
      end
      it "first_name_kana, last_name_kanaが全角カタカナであれば登録できる" do
        @user.first_name_kana = "ヤマダ"
        @user.last_name_kana = "シロウ"
        expect(@user).to be_valid
      end
    end
  end
end