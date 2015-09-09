class Resource < ActiveRecord::Base
  has_many :categorisations
  has_many :categories, through: :categorisations

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
end
