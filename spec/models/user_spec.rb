require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it 'nickname, email, password, first_name_zen, last_name_zen, first_name_kana, last_name_kana, birth_dayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上で英字と数字の両方を含んでいれば登録できる' do
        @user.password = 's12345'
        @user.password_confirmation = 's12345'
        expect(@user).to be_valid
      end
      it 'first_name_zen, last_name_zenが全角かなであれば登録できる' do
        @user.first_name_zen = '山田'
        @user.last_name_zen = '四郎'
        expect(@user).to be_valid
      end
      it 'first_name_kana, last_name_kanaが全角カタカナであれば登録できる' do
        @user.first_name_kana = 'ヤマダ'
        @user.last_name_kana = 'シロウ'
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailに@を含まない場合、登録できない' do
        @user.email = 'testcom'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordが空だと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下だと登録できない' do
        @user.password = 's1234'
        @user.password_confirmation = 's1234'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが英字と数字の両方を含んでないと登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordが存在してもpassword_confirmationが空だと登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'first_name_zenが空だと登録できない' do
        @user.first_name_zen = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name zen can't be blank")
      end
      it 'first_name_zenが全角かなでないと登録できない' do
        @user.first_name_zen = 'abc'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name zen is invalid')
      end
      it 'last_name_zenが空だと登録できない' do
        @user.last_name_zen = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name zen can't be blank")
      end
      it 'last_name_zenが全角かなでないと登録できない' do
        @user.last_name_zen = 'abc'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name zen is invalid')
      end
      it 'first_name_kanaが空だと登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it 'first_name_kanaが全角カタカナでないと登録できない' do
        @user.first_name_kana = 'やまだ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid')
      end
      it 'last_name_kanaが空だと登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it 'last_name_kanaが全角カタカナでないと登録できない' do
        @user.last_name_kana = 'さぶろう'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana is invalid')
      end
      it 'birth_dayが空だと登録できない' do
        @user.birth_day = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth day can't be blank")
      end
    end
  end
end
