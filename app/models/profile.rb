class Profile < ApplicationRecord
  belongs_to :user

  mount_uploader :image, ImageUploader
  mount_uploader :back_image, ImageUploader
end
