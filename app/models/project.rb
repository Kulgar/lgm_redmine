class Project < ApplicationRecord

  validates :title, presence: true
  validates :slug, presence: true, length: { maximum: 60 }

  before_validation :set_slug

  private

    def set_slug
      self.slug = self.title.first(60).parameterize
    end

end
