class CreateOrderBuyers < ActiveRecord::Migration[6.0]
  def change
    create_table :order_buyer do |t|

      t.timestamps
    end
  end
end
