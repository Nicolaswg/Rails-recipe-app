require 'rails_helper'

RSpec.describe Recipe, type: :model do
	before :each do
		@user = User.new(name: "test", email: "test@gmail.com", password: "123456", confirmed_at: DateTime.now)
		@food = Food.new(name: "apple", measurement_unit: "gram", price: 10, user_id: @user.id)
		@user.save
		@food.save
	end

	subject do
    Recipe.new(user_id: @user.id, name: 'arepa', preparation_time: 1,
      cooking_time: 2, description: 'description', public: true)
  end
  before { subject.save }

	describe 'validate data' do
		it 'it should have a name' do
			subject.name = nil
			expect(subject).to_not be_valid
		end
	
		it 'should have a description' do
			subject.description = nil
			expect(subject).to_not be_valid
		end
	
		it 'should have a preparation time' do
			subject.preparation_time = "a"
			expect(subject).to_not be_valid
		end

		it 'should have a cooking time' do
			subject.preparation_time = "a"
			expect(subject).to_not be_valid
		end

		it 'should have a public value' do
			subject.public = false
			expect(subject).to be_valid
		end
	end
end
