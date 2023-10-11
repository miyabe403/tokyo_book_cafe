class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :customer_id, null: false           # 会員ID
      t.integer :payment_method, null: false        # 支払方法
      t.string :postal_code, null: false            # 配送先郵便番号
      t.string :address, null: false                # 配送先住所
      t.string :name, null: false                   # 宛名
      t.integer :delivery_charge, null: false       # 送料
      t.integer :total_price, null: false           # 合計請求金額
      t.integer :status, null: false, default: 0    # 注文ステータス
      t.timestamps
    end
  end
end
