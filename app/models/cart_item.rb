class CartItem < ApplicationRecord
  # アソシエーションを設定 
  belongs_to :customer
  belongs_to :item
  belongs_to :order, optional: true
  
  # 合計金額を表示させる処理 
  # モデルに subtotal (小計) メソッドを定義 
  # 税込価格と数量をかけて算出 
  def subtotal
    item.with_tax_price * amount
  end
end
