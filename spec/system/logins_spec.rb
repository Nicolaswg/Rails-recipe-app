require 'rails_helper'

RSpec.describe 'Logins', type: :system do
  before do
    driven_by(:rack_test)
  end

  describe 'Login page' do
    before :each do
      visit user_session_path
    end

    it 'should have login text' do
      expect(page).to have_content 'Log in'
    end

    it 'should have Email input' do
      expect(page).to have_content 'Email'
    end

    it 'should have Password input' do
      expect(page).to have_content 'Password'
    end

    it 'should have login button' do
      expect(page).to have_button 'Log in'
    end
  end
end
