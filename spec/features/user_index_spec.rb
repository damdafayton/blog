require 'rails_helper'
# I can see the username of all other users.
# I can see the profile picture for each user.
# I can see the number of posts each user has written.
# When I click on a user, I am redirected to that user's show page.

RSpec.describe 'Index page,' do
  before { visit root_path }

  describe 'shows' do
    it 'username of all other users' do
      expect(page).to have_content('Tom')
      expect(page).to have_content('Lilly')
    end

    it 'shows profile picture for each user' do
      # expect(page).to have_css('.user-image', :count => 2)
      # expect(all('.user-image').count).to eq(2)
      expect(page).to have_selector('.user-image', count: 2)
    end

    it 'shows the number of posts each user has written' do
      expect(page).to have_content('Number of posts', count: 2)
    end
  end

  it 'redirects to user\'s show page when clicked on a user' do
    user = User.find(1)
    click_link user.name
    expect(page).to have_current_path(author_path(user.id))
  end
end
