class Post < ApplicationRecord
  authenticates_with_sorcery!
  belongs_to :user
  mount_uploader :photo, PhotoUploader
  validates :title, presence: true, length: { maximum: 255 }
  validates :body, length: { maximum: 10_000 }
end
