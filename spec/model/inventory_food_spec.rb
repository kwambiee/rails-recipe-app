require 'rails_helper'

RSpec.describe InventoryFood, type: :model do
    subject { InventoryFood.new(quantity: 1) }

    before { subject.save }
    after { InventoryFood.destroy_all }

    it 'is valid with valid attributes' do
        subject.quantity = 1
        expect(subject).to be_valid
    end


end
