class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.integer :customer_id, null: false     # 会員ID
      t.string :postal_code, null: false      # 配送先郵便番号
      t.string :address, null: false          # 配送先住所
      t.string :name, null: false             # 宛名
      t.timestamps
    end
  end
end
