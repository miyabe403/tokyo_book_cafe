class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.integer :genre_id, null: false                # ジャンルID
      t.string :name, null: false                     # 商品名
      t.text :explanation, null: false                # 商品説明文
      t.integer :price, null: false                   # 商品価格 (税抜)
      t.boolean :is_sell, null: false, default: true  # 販売ステータス
      t.timestamps
    end
  end
end
