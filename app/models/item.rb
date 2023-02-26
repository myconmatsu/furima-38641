class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  belongs_to :condition
  belongs_to :deliveryarea
  belongs_to :category
  belongs_to :shipmentday
  belongs_to :prefecture

  # has_one : order
  has_one_attached :image
  
  # 今回は記述不要
  # def was_attached?
  #   self.image.attached?
  # end


  with_options  presence: true do
    validates        :item_name 
    validates        :content
    validates        :category_id, numericality: { other_than: 1 }
    validates        :condition_id, numericality: { other_than: 1 }
    validates        :prefecture_id, numericality: { other_than: 1 }
    validates        :delivery_area_id, numericality: { other_than: 1 }
    validates        :shipment_day_id, numericality: { other_than: 1 }
    validates        :item_price,numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 } 
    validates        :item_price,numericality: { only_integer: true }
    validates        :image
  end

end
