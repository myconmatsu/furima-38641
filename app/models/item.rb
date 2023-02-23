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
  

  with_options  presence: true do
    validates        :item_name
    validates        :content
    validates        :category_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates        :condition_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates        :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates        :delivery_area_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates        :shipment_day_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates        :item_price
    validates        :image
  end

end
