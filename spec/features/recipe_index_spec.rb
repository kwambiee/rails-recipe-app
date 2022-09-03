require 'rails_helper'

RSpec.feature 'Recipe index page' do
  feature 'shows recipes' do
    background do
      visit new_user_session_path
      @user1 = User.create!(name: 'kwamboka', email: 'kwambokaj1@gmail.com', password: 'kwamboka')
      @recipe = Recipe.create(name: 'Parmesan Crusted Chicken', preparation_time: '10', cooking_time: '20',
                              description: 'Pizza description', public: true, user_id: @user1.id)

      fill_in 'Email', with: @user1.email
      fill_in 'Password', with: @user1.password

      click_button 'Log in'

      visit '/recipes'
    end

    scenario 'shows the recipe' do
      expect(page).to have_content(@recipe.name)
    end

    scenario 'shows the recipe description' do
      expect(page).to have_content(@recipe.description)
    end
  end
end
