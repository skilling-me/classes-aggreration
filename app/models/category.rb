class Category < ActiveRecord::Base
  has_many :categorisations
  has_many :resources, through: :categorisations
end
