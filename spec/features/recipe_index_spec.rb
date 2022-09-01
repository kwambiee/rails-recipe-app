require 'rails_helper'

RSpec.feature 'Recipe index page' do
  feature 'shows recipes' do
    background do
      @user1 = User.create(name: 'kwamboka', email: 'kwambokaj1@gmail.com', password: 'kwamboka')
      @recipe = Recipe.create(name: 'Parmesan Crusted Chicken', preparation_time: '10', cooking_time: '20', description: 'Pizza description', public: true, user_id: @user1.id)

      visit '/recipes'

    end

    scenario 'Shows list of recipes' do
      expect(page).to have_content(@recipe.name)
    end

    scenario 'Shows cooking time for recipe' do
      expect(page).to have_content(@recipe.cooking_time)
    end
  end
end