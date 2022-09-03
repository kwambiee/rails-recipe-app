require 'rails_helper'

RSpec.feature 'Inventory details page' do
  feature 'shows inventories details' do
    background do
      visit new_user_session_path
      @user1 = User.create!(name: 'kwamboka', email: 'kwambokaj1@gmail.com', password: 'kwamboka')
      @inventory = Inventory.create(name: 'Recipe one', description: 'Inventory one', user_id: @user1.id)

      fill_in 'Email', with: @user1.email
      fill_in 'Password', with: @user1.password

      click_button 'Log in'

      visit inventory_path(@inventory)
    end

    scenario 'shows the inventory' do
      expect(page).to have_content(@inventory.name)
    end
  end
end
