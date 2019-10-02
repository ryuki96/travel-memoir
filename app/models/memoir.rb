class Memoir < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_many :likes,dependent: :destroy
  # validates :place :image, presence: true #validateは空を許さない値を定義する
  mount_uploader :image, ImageUploader
end
