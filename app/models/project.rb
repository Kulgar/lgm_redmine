class Project < ApplicationRecord
  # bi-directional associations: https://guides.rubyonrails.org/association_basics.html#bi-directional-associations
  has_many :tasks, inverse_of: :project, dependent: :destroy
  # has_one :task

  validates :title, presence: true
  validates :slug, presence: true, length: { maximum: 60 }

  before_validation :set_slug

  scope :active, -> { where(archive: false) }
  # scope :recent, ->(time) { where("created_at > ?", time) }

  def self.recent(date = Date.yesterday)
    where("created_at > ?", date)
  end

  private

    def set_slug
      self.slug = self.title.first(60).parameterize
    end

end
