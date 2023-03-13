class Buyer < ApplicationRecord
 
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :order
  belongs_to :prefecture

  # create_table :addresses do |t|
  #   t.string         :post_code,           null:false
  #   t.integer        :prefecture_id,       null:false
  #   t.string         :city,                null:false
  #   t.string         :prefecture_id,       null:false
  #   t.string         :building_name,       null:false
  #   t.string         :phone_number,        null:false
  #   t.references     :order,               null:false,foreign_key: true
 
end
