class Category < ActiveRecord::Base
  has_many :categorisations
  has_may :resources, through: :categorisations
end
