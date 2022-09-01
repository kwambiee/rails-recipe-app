require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  subject { RecipeFood.new(quantity: 1) }

  before { subject.save }
  after { RecipeFood.destroy_all }

  it 'is valid with valid attributes' do
    subject.quantity = 1
    expect(subject).to be_valid
  end

end