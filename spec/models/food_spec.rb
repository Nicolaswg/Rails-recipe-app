require 'rails_helper'

RSpec.describe Food, type: :model do
  subject do
    Food.new(user_id: 1, name: 'onion', measurement_unit: 'grams', price: 30)
  end
  before { subject.save }

  it 'it should have a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'shoudl have a measurement unit' do
    subject.measurement_unit = nil
    expect(subject).to_not be_valid
  end

  it 'price must be an integer' do
    subject.price = 'a'
    expect(subject).to_not be_valid
  end
end
