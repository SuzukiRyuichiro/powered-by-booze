class Review < ApplicationRecord
  belongs_to :cocktail

  validates :content, presence: true
  validates :name, presence: true
  validates :rating, inclusion: { in: (0..5).to_a }
  validates :name, uniqueness: { scope: :cocktail }
end
