class RecipesController < ApplicationController
    before_action :set_recipe, only: [:show, :edit, :update]

    def index
        @recipes = Recipe.all 
    end

    def new
        @recipe = Recipe.new
        
    end

    def create
        @recipe = Recipe.new(recipe_params)
        
        if @recipe.valid?
            @recipe.save
            redirect_to recipe_path(@recipe)
        else
            render "new"
        end
    end

    def show
    end

    def edit
    end

    def update
        @recipe.update(recipe_params)
        redirect_to recipe_path(@recipe)
    end


    private

    def set_recipe
        @recipe = Recipe.find(params[:id])
    end

    def recipe_params
        params.require(:recipe).permit(:name, ingredient_ids: [], ingredients_attributes: [:name])
    end
end
