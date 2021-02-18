class Ingredient < ApplicationRecord
  belongs_to :dose

  validates :name, presence: true, uniqueness: true
end
