class Address < ApplicationRecord
  # アソシエーションを設定 
  belongs_to :customer
end
