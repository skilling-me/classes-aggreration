class Resource < ActiveRecord::Base
  has_many :categorisations, dependent: :destroy
  has_many :categories, through: :categorisations
  has_many :reviews, dependent: :destroy

  validates :url, uniqueness: true, presence: true
  validates :title, presence: true

  include PgSearch
  pg_search_scope :search_by_user,
    against: {
      title: 'A',
      url: 'B',
      description: 'C'
    },
    :using => {
      tsearch: { prefix: true }
    }

  acts_as_taggable # Alias for acts_as_taggable_on :tags
  acts_as_taggable_on :cost, :type, :level

end
