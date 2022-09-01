require 'rails_helper'

RSpec.feature 'Inventory index page' do
  feature 'shows inventories' do
    background do
      visit new_user_session_path
      @user1 = User.create!(name: 'kwamboka', email: 'kwambokaj1@gmail.com', password: 'kwamboka')
      @inventory = Inventory.create(name: 'Recipe one', description: 'Inventory one', user_id: @user1.id)

      fill_in 'Email', with: @user1.email
      fill_in 'Password', with: @user1.password

      click_button 'Log in'

      visit inventories_path
    end

    scenario 'shows the inventory' do
      expect(page).to have_content(@inventory.name)
    end

    scenario 'shows the inventory description' do
      expect(page).to have_content(@inventory.description)
    end
  end
end
