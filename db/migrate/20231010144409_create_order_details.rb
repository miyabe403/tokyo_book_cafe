class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|
      t.integer :order_id, null: false                          # 注文ID
      t.integer :item_id, null: false                           # 商品ID
      t.integer :purchase_price, null: false                    # 購入時価格 (税込)
      t.integer :amount, null: false                            # 個数
      t.integer :production_status, null: false, default: 0     # 制作ステータス 
      t.timestamps
    end
  end
end
