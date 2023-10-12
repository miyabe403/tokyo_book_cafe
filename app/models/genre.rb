class Genre < ApplicationRecord
  # アソシエーションを設定
  has_many :items, dependent: :destroy
end
