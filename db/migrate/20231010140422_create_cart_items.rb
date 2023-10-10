class CreateCartItems < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_items do |t|
      t.integer :customer_id, null: false    # 会員ID
      t.integer :item_id, null: false       # 商品ID
      t.integer :amount, null: false        # 個数
      t.timestamps
    end
  end
end
