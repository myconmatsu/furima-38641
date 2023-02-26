FactoryBot.define do
  factory :item do
      item_name          {"名前"}
      content    {"説明"}
      category_id        {2}
      condition_id  {2}
      shipment_day_id         {2}
      prefecture_id      {2}
      delivery_area_id         {2}
      item_price           {2000}
      user_id {1}
      association :user
 
      after(:build) do |item|
        item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
      end
    end
end
