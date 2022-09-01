require 'rails_helper'

RSpec.feature 'Food index page' do
  feature 'shows foods' do
    background do
      visit new_user_session_path
      @user1 = User.create!(name: 'kwamboka', email: 'kwambokaj1@gmail.com', password: 'kwamboka')
      @food = Food.create(name: 'Pizza', measurement_unit: 'kg', price: '3')
      fill_in 'Email', with: @user1.email
      fill_in 'Password', with: @user1.password

      click_button 'Log in'

      visit foods_path
    end

    scenario 'shows the food' do
      expect(page).to have_content(@food.name)
    end

    scenario 'shows the food price' do
      expect(page).to have_content(@food.price)
    end

    scenario 'shows the food measurement unit' do
      expect(page).to have_content(@food.measurement_unit)
    end
  end
end
