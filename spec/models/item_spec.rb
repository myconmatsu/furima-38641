require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品情報入力' do
    context '商品情報入力ができる場合' do
        it '全ての値が正しく入力されていれば出品きる' do
        expect(@item).to be_valid
      end
    end
    context '商品情報の入力ができない場合' do
      it 'imageが空だと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'item_nameが空だと出品できない' do
        @item.item_name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it 'contentが空だと出品できない' do
        @item.content = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Content can't be blank")
      end
      it 'category_idが未選択だと出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it 'condition_idが未選択だと出品できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 1")
      end
      it 'shipment_day_idが未選択だと出品できない' do
        @item.shipment_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipment day must be other than 1")
      end
      it 'prefecture_idが未選択だと出品できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it 'delivery_area_idが未選択だと出品できない' do
        @item.delivery_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery area must be other than 1")
      end
      it 'item_priceが空だと出品できない' do
        @item.item_price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price can't be blank")
      end
      it 'item_priceが全角数字だと出品できない' do
        @item.item_price = "２０００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price is not a number")
      end
      it 'item_priceが設定範囲以外だと出品できない' do
        @item.item_price = 100000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price must be less than or equal to 9999999")
      end
    end
  end
end

