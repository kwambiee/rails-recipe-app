require 'rails_helper'

RSpec.feature 'Recipe show page' do
  feature 'shows recipes in details' do
    background do
      visit new_user_session_path
      @user1 = User.create!(name: 'kwamboka', email: 'kwambokaj1@gmail.com', password: 'kwamboka')

      fill_in 'Email', with: @user1.email
      fill_in 'Password', with: @user1.password

      click_button 'Log in'

      @recipe = Recipe.create(name: 'Parmesan Crusted Chicken', preparation_time: '10', cooking_time: '20',
                              description: 'Pizza description', public: true, user_id: @user1.id)

      visit recipe_path(@recipe)
    end

    scenario 'shows the recipe' do
      expect(page).to have_content(@recipe.name)
    end

    scenario 'shows recipe cooking time' do
      expect(page).to have_content('Cooking_time: 20:00hr')
    end

    scenario 'shows recipe preparation time' do
      expect(page).to have_content('Preparation_time: 10:00hr')
    end
  end
end
