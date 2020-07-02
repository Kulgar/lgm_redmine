class Task < ApplicationRecord
  belongs_to :project, inverse_of: :tasks, counter_cache: true

  validates :title, presence: true
  validates :priority, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }

  scope :most_importants, -> { where(priority: (4..5)) }
  scope :by_priority, -> { order("priority desc") }
end
