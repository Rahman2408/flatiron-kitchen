class Ingredient < ApplicationRecord
    has_many :recipe_ingredients
    has_many :recipes, through: :recipe_ingredients
    accepts_nested_attributes_for :recipes
    validates :name, presence: true 
end
