class OrderDetail < ApplicationRecord
  # アソシエーションを設定 
  belongs_to :order
  belongs_to :item
  
  # enum の設定
  # 製作ステータス
  enum production_status: {
      untouched: 0,  # untouched (着手不可)
      waiting: 1,    # waiting (製作待ち)
      working: 2,    # working (製作中)
      completed: 3   # completed (製作完了)
  }
  
  # 合計金額を表示させる処理 
  # モデルに subtotal (小計) メソッドを定義 
  # 税込価格と数量をかけて算出
  def subtotal
    item.with_tax_price * amount
  end
end
