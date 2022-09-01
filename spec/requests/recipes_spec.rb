require 'rails_helper'

RSpec.describe Recipe, type: :request do

    describe 'All recipes' do
        it 'returns http success' do
        get '/recipes'
        expect(response).to have_http_status(302)
        end
    end

    describe 'show recipe' do
        it 'returns http success' do
        get '/recipes/1'
        expect(response).to have_http_status(302)
        end
    end

    describe 'new recipe' do
        before(:example) { get '/recipes/new' }
        it 'returns http success' do
        expect(response).to have_http_status(302)
        end
    end

    describe 'add recipes' do
        before(:example) { post '/recipes', params: { recipe: { name: 'Pizza', preparation_time: '10', cooking_time: '20', description: 'Pizza description', public: true } } }
        it 'returns http success' do
        expect(response).to have_http_status(302)
        end
    end


    describe 'delete recipe' do
        it 'returns http success' do
        delete '/recipes/1'
        expect(response).to have_http_status(302)
        end
    end

end