require 'rails_helper'
describe Item do
  before do
    @item = FactoryBot.build(:item)
  end
  
  describe '商品出品機能' do
    it 'name、description、category、status、shipping、prefecture、shipping_day、priceが存在すれば登録できる' do
      expect(@item).to be_valid
    end

    it 'imageが空では登録できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it 'nameが空では登録できない' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    
    it 'descriptionが空では登録できない' do
      @item.description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end

    it 'categoryが空では登録できない' do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end

    it 'statusが空では登録できない' do
      @item.status_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Status can't be blank")
    end

    it 'shippingが空では登録できない' do
      @item.shipping_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping can't be blank")
    end

    it 'prefectureが空では登録できない' do
      @item.prefecture_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank")
    end

    it 'shipping_dayが空では登録できない' do
      @item.shipping_day_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping day can't be blank")
    end

    it 'priceが空では登録できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it 'priceが半角数字で価格の範囲が¥300~¥9,999,999の間であれば登録できる' do
      @item.price = '300'
      expect(@item).to be_valid
    end
  end
end
