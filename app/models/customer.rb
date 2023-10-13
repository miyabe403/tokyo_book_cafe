class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # アソシエーションを設定 
  has_many :cart_items, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # バリデーションを設定 
  # validatesで対象とする項目を指定し、入力されたデータの
  # presence（存在）をチェックします。 trueと記述すると、
  # データが存在しなければならないという設定になります。
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :postal_code, presence: true
  validates :address, presence: true
  
  # アソシエーションを設定
  has_many :addresses, dependent: :destroy
end
