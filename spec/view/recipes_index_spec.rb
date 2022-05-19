require 'rails_helper'

RSpec.describe 'Recipe', type: :system do
  describe 'Index' do
    before(:each) do
      @u1 = User.new(id: 8, name: 'Nicolas', password: '123123', email: 'nico@las')
      @u1.save
      @r1 = Recipe.new(id: 1, name: 'new recipe', preparation_time: 5, cooking_time: 5,
                        description: 'delicious', user_id: 8, public: true)
      @r1.save
      RecipeFood.new(id: 1, quantity: 4, recipe_id: 2, food_id: 1)
      
      Food.new(id: 201, name: 'food', price: 30, user_id: 8, measurement_unit: 'grams')
    end

    before(:each) do
      visit new_user_session_path
      fill_in 'Email', with: 'nico@las'
      fill_in 'Password', with: '123123'
      click_button 'Login'
      click_link 'My recipe'
    end

    it 'I can see All recipes' do
      expect(page).to have_content('All recipes')
    end

    it 'I can see the button to create a new recipe' do
      expect(page).to have_content('Add new Recipe')
    end

    it 'I can see a recipe name' do
      expect(page).to have_content('recipe1')
    end

    it 'I can see a description of the recipe' do
      expect(page).to have_content('description')
    end

    it 'I can see how many likes a post has.' do
      expect(page).to have_content('Likes: 2')
    end

    it 'I can see a button to remove the recipe' do
      expect(page).to have_content('Remove')
    end

    it 'When I click on a post, it redirects me to the recipe show page.' do
      click_on 'recipe1'
      expect(page.current_path).to eq('/users/1/recipes/1')
    end

  end
end