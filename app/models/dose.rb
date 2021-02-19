class Dose < ApplicationRecord
  belongs_to :cocktail
  belongs_to :ingredient
  has_many :reviews

  validates :description, presence: true
  # validates :ingredient, uniqueness: { scope: :cocktail }
end

