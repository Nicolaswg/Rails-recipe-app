class RecipeFood < ApplicationRecord
	belongs_to :foods, class_name: 'Food'
	belongs_to :recipes, class_name: 'Recipe'
end
