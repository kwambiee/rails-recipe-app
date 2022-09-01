require 'rails_helper'

RSpec.describe InventoryFood, type: :request do

    describe 'new inventory food' do
        before(:example) { get '/inventories/1/inventory_foods/new' }
        it 'returns http success' do
        expect(response).to have_http_status(302)
        end
    end

    describe 'delete inventory food' do
        it 'returns http success' do
        delete '/inventories/1/inventory_foods/1'
        expect(response).to have_http_status(302)
        end
    end
end
