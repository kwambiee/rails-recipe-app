require 'rails_helper'

RSpec.describe Inventory, type: :request do

    describe 'All inventories' do
        it 'returns http success' do
        get '/inventories'
        expect(response).to have_http_status(302)
        end
    end

    describe 'create inventory' do
        before(:example) { post '/inventories', params: { inventory: { name: 'Inventory 1', description: 'Inventory 1 description' } } }
        it 'returns http success' do
        expect(response).to have_http_status(302)
        end
    end

    describe 'new inventory' do
        before(:example) { get '/inventories/new' }
        it 'returns http success' do
        expect(response).to have_http_status(302)
        end
    end

    describe 'delete inventory' do
        it 'returns http success' do
        delete '/inventories/1'
        expect(response).to have_http_status(302)
        end
    end

end