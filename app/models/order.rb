class Order < ApplicationRecord
  # アソシエーションを設定 
  belongs_to :customer
  has_many :order_details, dependent: :destroy
  
  enum payment_method: { credit_card: 0, transfer: 1 }

  # enum の設定
  # 注文ステータス
  enum status: {
    waiting: 0,     # waiting (入金待ち)  例 : waiting_payment（入金待ち）
    paid_up: 1,     # paid_up (支払い済み)例 : confirm_payment（入金確認）
    making: 2,      # making (制作中) 　　例 : shipped（出荷済み）
    preparing: 3,   # pewparing (準備中)  例 : out_for_delivery（配送中）
    shippend: 4     # shippend (配達済み) 例 : delivered（配達済み）

  }
  
  # 請求額を求めるメソッド
  def billing_amount
    self.total_price + self.delivery_charge
  end
end
