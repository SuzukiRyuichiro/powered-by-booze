class ReviewsController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @review = Review.new(cocktail_id: params[:cocktail_id])

  end

  def create

  end
end
