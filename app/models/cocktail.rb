class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  has_many :reviews
  has_one_attached :photo

  validates :name, presence: true
  # validates :imageURL, format: { with: /https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}(\/[-a-zA-Z0-9@:%._\+~#=]*)*/i, message: "please enter URL in correct format"}
end
