class OrderBuyer
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :user_id, :item_id,:token
 
  with_options presence: true do
    validates :house_number
    validates :user_id
    validates :item_id
    validates :token
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :phone_number, format: {with: /\A\d{10,11}\z/}
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  end

    def save
      order = Order.create(user_id: user_id, item_id: item_id)
      Buyer.create(post_code: post_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name,
                     phone_number: phone_number, order_id: order.id)
    end
end
