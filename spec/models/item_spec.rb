require 'rails_helper'
describe Item do
  before do
    @item = FactoryBot.build(:item)
  end
  
  describe '商品出品機能' do
    it 'name、description、category、status、shipping、prefecture、shipping_day、priceが存在すれば出品できる' do
      expect(@item).to be_valid
    end

    it 'imageが空では出品できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it 'nameが空では出品できない' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    
    it 'descriptionが空では出品できない' do
      @item.description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end

    it 'categoryが空では出品できない' do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end

    it 'category_idが1では出品できない' do
      @item.category_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end

    it 'statusが空では出品できない' do
      @item.status_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Status can't be blank")
    end
    
    it 'status_idが1では出品できない' do
      @item.status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Status must be other than 1")
    end

    it 'shippingが空では出品できない' do
      @item.shipping_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping can't be blank")
    end

    it 'shipping_idが1では出品できない' do
      @item.shipping_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping must be other than 1")
    end

    it 'prefectureが空では出品できない' do
      @item.prefecture_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank")
    end

    it 'prefecture_idが1では出品できない' do
      @item.prefecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
    end

    it 'shipping_dayが空では出品できない' do
      @item.shipping_day_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping day can't be blank")
    end

    it 'shipping_day_idが1では出品できない' do
      @item.shipping_day_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping day must be other than 1")
    end

    it 'priceが空では出品できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it 'priceが半角数字で価格が¥299円だと出品できない' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
    end

    it 'priceが半角数字で価格が¥9,999,999円以上だと出品できない' do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
    end
  end
end
