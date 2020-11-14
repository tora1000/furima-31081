require 'rails_helper'

RSpec.describe ItemOrder, type: :model do
  describe '購入情報の保存' do
    before do
      @item_order = FactoryBot.build(:item_order)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@item_order).to be_valid
    end
    it 'post_numberが空だと保存できないこと' do
      @item_order.post_number = nil
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Post number can't be blank")
    end
    it 'post_numberに半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @item_order.post_number = '1234567'
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include('Post number is invalid. Include hyphen(-)')
    end
    it 'prefectureが空だと保存できないこと' do
      @item_order.prefecture_id = ''
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Prefecture can't be blank")
    end

    it 'prefecture_idが1だと保存できないこと' do
      @item_order.prefecture_id = 1
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include('Prefecture must be other than 1')
    end

    it 'cityが空だと保存できないこと' do
      @item_order.city = nil
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("City can't be blank")
    end

    it 'addressが空だと保存できないこと' do
      @item_order.address = nil
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Address can't be blank")
    end

    it 'phone_numberが空だと保存できないこと' do
      @item_order.phone_number = nil
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Phone number can't be blank")
    end

    it 'phone_numberは半角ハイフンが含まれると保存できないこと' do
      @item_order.phone_number = '080-1234-5678'
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include('Phone number is invalid')
    end

    it 'phone_numberは11桁以内でないと保存できないこと' do
      @item_order.phone_number = '080123456789'
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include('Phone number is too long (maximum is 11 characters)')
    end

    it 'tokenが空では保存できないこと' do
      @item_order.token = nil
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Token can't be blank")
    end
  end
end
