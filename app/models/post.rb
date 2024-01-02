class Post < ApplicationRecord
  authenticates_with_sorcery!
  belongs_to :user
  mount_uploader :photo, PhotoUploader
  validates :photo, presence: true
  validates :title, presence: true, length: { maximum: 255 }
  validates :body, length: { maximum: 10_000 }
  validates :is_public, inclusion: [true, false]

  def is_public?
    self.is_public
  end
end
