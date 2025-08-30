class Thought < ApplicationRecord
  validates :title, presence: true

  scope :featured, -> { where(featured: true) }
  scope :recent, -> { order(created_at: :desc) }
end
