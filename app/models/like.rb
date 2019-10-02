class Like < ApplicationRecord
  belongs_to :memoir,counter_cache: :likes_count
  belongs_to :user

  validates_uniqueness_of :memoir_id, scope: :user_id
end
