class Post < ApplicationRecord
  belongs_to :user
  has_many :memoirs,dependent: :destroy
  has_many :comments,dependent: :destroy
end
