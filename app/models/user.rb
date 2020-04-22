class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books
  attachment :profile_image, destroy: false

  # ユーザ名は最小2文字かつ最大２０文字の範囲で
  validates :name, length: {maximum: 20, minimum: 2}
  # 自己紹介文は最大50文字まで
  validates :introduction, length: {maximum: 50}
end
