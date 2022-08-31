require 'rails_helper'

RSpec.describe Food, type: :request do
  let(:user) { User.create!(name: 'Ger', email: 'abol@gmail.com', password: '123456') }
  let(:valid_attributes) do
    { name: 'Pizza', measurement_unit: 2, price: 3  }
  end
  describe 'GET /foods' do
    it 'shows the food' do
      Food.create! valid_attributes
      get foods_path
      expect(response).to have_http_status(302)
    end
  end

end