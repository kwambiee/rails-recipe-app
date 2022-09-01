require 'rails_helper'

RSpec.describe RecipeFood, type: :request do
  describe 'edit recipe food' do
    before(:example) { get '/recipes/1/recipe_foods/1/edit' }
    it 'returns http success' do
      expect(response).to have_http_status(302)
    end
  end

  describe 'delete recipe food' do
    it 'returns http success' do
      delete '/recipes/1/recipe_foods/1'
      expect(response).to have_http_status(302)
    end
  end
end
