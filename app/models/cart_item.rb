class CartItem < ApplicationRecord
  # アソシエーションを設定 
  belongs_to :item
end
