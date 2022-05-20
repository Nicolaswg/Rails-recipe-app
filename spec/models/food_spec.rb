require 'rails_helper'

RSpec.describe Food, type: :model do
  before :each do
    @user = User.new(name: 'test', email: 'test@gmail.com', password: '123456', confirmed_at: DateTime.now)
    Food.new(name: 'apple', measurement_unit: 'gram', price: 10, user_id: @user.id)
    @user.save
  end

  subject do
    Food.new(
      name: 'apple',
      measurement_unit: 'gram',
      price: 10,
      user_id: @user.id
    )
  end

  before { subject.save }

  describe 'validate data' do
    it 'has a valid name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'has a valid measurement_unit' do
      subject.measurement_unit = nil
      expect(subject).to_not be_valid
    end

    it 'has a valid price' do
      subject.price = 'a'
      expect(subject).to_not be_valid
    end
  end
end
