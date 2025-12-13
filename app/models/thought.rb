class Thought < ApplicationRecord
  has_one_attached :thumbnail
  has_rich_text :body

  validates :title, presence: true

  scope :featured, -> { where(featured: true) }
  scope :recent, -> { order(created_at: :desc) }
end
