require 'rails_helper'

RSpec.describe Recipe, type: :model do
  subject { Recipe.new(name: 'Fish fingers', preparation_time: '00:30:00', cooking_time: '01:00:00', description: 'Yummy') }

  before { subject.save }
  after { Recipe.destroy_all }

  it 'is valid with valid attributes' do
    subject.name = 'Fish fingers'
    expect(subject).to be_valid
  end

  it 'is valid with valid attributes' do
    subject.preparation_time = '00:30:00'
    expect(subject).to be_valid
  end

  it 'is valid with valid attributes' do
    subject.cooking_time = '01:00:00'
    expect(subject).to be_valid
  end

  it 'is valid with valid attributes' do
    subject.description = 'Yummy'
    expect(subject).to be_valid
  end
end
