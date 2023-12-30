class Post < ApplicationRecord
  authenticates_with_sorcery!
  belongs_to :user
  validates :title, presence: true, length: { maximum: 255 }
  validates :body, length: { maximum: 10_000 }
end
