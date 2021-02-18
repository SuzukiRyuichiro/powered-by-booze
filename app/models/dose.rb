class Dose < ApplicationRecord
  has_many :cocktails
  has_many :ingredients

  validates :description, presence: true
end
