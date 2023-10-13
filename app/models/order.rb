class Order < ApplicationRecord
  # アソシエーションを設定 
  belongs_to :customer
  has_many :order_details, dependent: :destroy
  
  enum payment_method: { credit_card: 0, transfer: 1 }

  # enum の設定
  # 注文ステータス
  enum status: {
    waiting: 0,     # waiting (入金待ち) 
    paid_up: 1,     # paid_up (入金確認) 
    making: 2,      # making (製作中) 　
    preparing: 3,   # pewparing (発送準備中)  
    shippend: 4     # shippend (発送済み)

  }
  
  # 請求額を求めるメソッド 
  def billing_amount
    self.total_price + self.delivery_charge
  end
end
