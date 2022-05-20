require 'rails_helper'

RSpec.describe 'Recipe', type: :system do
  describe 'Index' do
    before(:each) do
      @u1 = User.new(id: 1, name: 'Nicolas', password: '123123', email: 'nico@las')
      @u1.save
      @r1 = Recipe.new(id: 1, name: 'new recipe', preparation_time: 5, cooking_time: 5,
                        description: 'delicious', user_id: 1, public: true)
      @r1.save
    end

    before(:each) do
      visit new_user_session_path
      fill_in 'Email', with: 'nico@las'
      fill_in 'Password', with: '123123'
      click_button 'Log in'
      click_link 'My recipe'
    end

    it 'I can see All recipes' do
      expect(page).to have_content('All recipes')
    end

    it 'I can see the button to create a new recipe' do
      expect(page).to have_content('Add new Recipe')
    end

    it 'I can see a recipe name' do
      expect(page).to have_content('new recipe')
    end

    it 'I can see a description of the recipe' do
      expect(page).to have_content('delicious')
    end

    it 'I can see a button to remove the recipe' do
      expect(page).to have_content('Remove')
    end

    it 'When I click on a recipe, it redirects me to the recipe show page.' do
      click_on 'new recipe'
      expect(page.current_path).to eq('/users/1/recipes/1')
    end

  end
end