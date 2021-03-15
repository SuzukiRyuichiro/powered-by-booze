class Api::V1::CocktailsController < Api::V1::BaseController
  def search
    if params[:query]
      @cocktails = Cocktail.search_by_name_instruction_and_ingredients(params[:query]).first(5)
      render json: @cocktails.map do |cocktail|
        {
          name: cocktail.name,
          instruction: cocktail.instruction,
        }
      end
    end
  end
end
