require 'rails_helper'

RSpec.describe PurchaserCard, type: :model do
  describe '配送先住所の保存' do
    before do
      @purchaser_card = FactoryBot.build(:purchaser_card)
    end

    it 'すべての値が正しく入力されていれば保存できる' do
      expect(@purchaser_card).to be_valid
    end
    it 'tokenが空だと保存できない' do
      @purchaser_card.token = ""
      @purchaser_card.valid?
      expect(@purchaser_card.errors.full_messages).to include("Token can't be blank")
    end
    it 'postal_codeが空だと保存できない' do
      @purchaser_card.postal_code = ""
      @purchaser_card.valid?
      expect(@purchaser_card.errors.full_messages).to include("Postal code can't be blank", "Postal code is invalid. Include hyphen(-)")
    end
    it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できない' do
      @purchaser_card.postal_code = "1234567"
      @purchaser_card.valid?
      expect(@purchaser_card.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end
    it 'prefecture_idを選択していないと保存できない' do
      @purchaser_card.prefecture_id = 1
      @purchaser_card.valid?
      expect(@purchaser_card.errors.full_messages).to include("Prefecture can't be blank")
    end
    it 'municipalityが空だと保存できない' do
      @purchaser_card.municipality = ""
      @purchaser_card.valid?
      expect(@purchaser_card.errors.full_messages).to include("Municipality can't be blank")
    end
    it 'addressが空だと保存できない' do
      @purchaser_card.address = ""
      @purchaser_card.valid?
      expect(@purchaser_card.errors.full_messages).to include("Address can't be blank")
    end
    it 'building_nameが空でも保存できる' do
      @purchaser_card.building_name = ""
      expect(@purchaser_card).to be_valid
    end
    it 'phone_numberが空だと保存できない' do
      @purchaser_card.phone_number = ""
      @purchaser_card.valid?
      expect(@purchaser_card.errors.full_messages).to include("Phone number can't be blank", "Phone number is invalid")
    end
    it 'phone_numberは11桁以内でないと保存できない' do
      @purchaser_card.phone_number = "1234567890123"
      @purchaser_card.valid?
      expect(@purchaser_card.errors.full_messages).to include("Phone number is invalid")
    end
    it 'phone_numberはハイフンを含むと保存できない' do
      @purchaser_card.phone_number = "090-1234-5678"
      @purchaser_card.valid?
      expect(@purchaser_card.errors.full_messages).to include("Phone number is invalid")
    end

  end
end