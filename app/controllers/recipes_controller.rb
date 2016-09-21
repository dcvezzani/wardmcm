class RecipesController < ApplicationController
  def index
    @recipes = if params[:keywords]
                 Recipe.where('upper(name) like upper(?)',"%#{params[:keywords]}%")
               else
                 []
               end    
  end
end
