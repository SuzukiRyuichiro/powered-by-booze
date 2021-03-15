class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  has_many :reviews, dependent: :destroy
  has_one_attached :photo

  validates :name, presence: true
  # validates :imageURL, format: { with: /https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}(\/[-a-zA-Z0-9@:%._\+~#=]*)*/i, message: "please enter URL in correct format"}

  include PgSearch::Model
   pg_search_scope :search_by_name_instruction_and_ingredients,
     against: [ :name, :instruction ],
     associated_against: {
      ingredients: [ :name ]
    },
     using: {
       tsearch: { prefix: true, dictionary: "english" }
     }
end
