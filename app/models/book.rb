class Book < ApplicationRecord

	belongs_to :user

	validates :title, presence: true
	validates :title, presence: {message: "error"}

	validates :body, presence: true, length: {maximum: 200}
	validates :body, presence: {message: "error"}
end
