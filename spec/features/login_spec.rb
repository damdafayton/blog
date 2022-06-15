require 'rails_helper'

RSpec.describe 'Login Page,' do
  before { visit user_session_path }

  describe 'loads and' do
    it 'shows the email input' do
      expect(page).to have_content('Email')
    end

    it 'shows the password input' do
      expect(page).to have_content('Password')
    end

    it 'shows the submit button' do
      expect(page).to have_content('Log in')
    end
  end

  describe 'when I click the submit button,' do
    it 'shows detailed error if username and password is not filled' do
      click_button 'Log in'
      expect(page).to have_content('Invalid Email or password')
    end

    it 'shows detailed error if incorrect data is filled' do
      fill_in 'Email', with: 'RubyYagi@rails.go'
      click_button 'Log in'
      expect(page).to have_content('Invalid Email or password')
    end

    it 'show detailed error to confirm email if email is not confirmed' do
      fill_in 'Email', with: 'fake1@fake.com'
      fill_in 'Password', with: '123456'
      click_button 'Log in'
      expect(page).to have_content('You have to confirm your email address')
    end

    it 'show success message and redirects to root page if correct data is filled' do
      # confirm user email
      User.find(1).update(confirmed_at: DateTime.now)

      fill_in 'Email', with: 'fake1@fake.com'
      fill_in 'Password', with: '123456'
      click_button 'Log in'

      expect(page).to have_content('Signed in successfully')
      expect(page).to have_current_path '/'
    end
  end
end
