require 'rails_helper'

RSpec.describe Recipe, type: :model do
  subject do
    Recipe.new(user_id: 1, name: 'arepa', preparation_time: 1,
      cooking_time: 2, description: 'description', public: true)
  end
  before { subject.save }

  it 'it should have a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'shoudl have a description' do
    subject.description = nil
    expect(subject).to_not be_valid
  end

end
