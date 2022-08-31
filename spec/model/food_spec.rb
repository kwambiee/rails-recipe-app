require 'rails_helper'

RSpec.describe Food, type: :model do
  subject { Food.new(name: 'Pizza', measurement_unit: 2, price: 3) }

  before { subject.save }
  after { Food.destroy_all }

  it 'is valid with valid attributes' do
    subject.name = 'Pizza'
    expect(subject).to be_valid
  end
  it 'is valid with valid attributes' do
    subject.measurement_unit = 2.0
    expect(subject).to be_valid
  end
  it 'is valid with valid attributes' do
    subject.price = 3
    expect(subject).to be_valid
  end
end
