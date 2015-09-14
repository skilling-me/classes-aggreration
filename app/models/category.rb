class Category < ActiveRecord::Base
  validates :slug, uniqueness: true, presence: true
  validates :title, presence: true
  has_many :categorisations
  has_many :resources, through: :categorisations
end
