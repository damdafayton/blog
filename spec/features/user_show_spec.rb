require 'rails_helper'

# I can see the user's profile picture.
# I can see the user's username.
# I can see the number of posts the user has written.
# I can see the user's bio.
# I can see the user's first 3 posts.
# I can see a button that lets me view all of a user's posts.
# When I click a user's post, it redirects me to that post's show page.
# When I click to see all posts, it redirects me to the user's post's index page.

RSpec.describe 'User show page,' do
  before do
    @user = User.find(1)
    visit author_path(@user.id)
  end

  describe 'renders' do
    it 'user\'s profile picture' do
      expect(page).to have_selector('.user-image', count:1)
    end

    it 'user\'s name' do
      expect(page).to have_content(@user.name)
    end

    it 'number of posts user has written' do
      expect(page).to have_content('Number of posts')
    end

    it 'user\'s bio' do
      expect(page).to have_content('Bio:')
    end

    it 'user\'s first 2 posts' do
      expect(page).to have_selector('.blog-card', count: 3) # one card for user bio
    end

    it 'button that let\'s me view user\'s all posts' do
      expect(page).to have_content('See all posts')
    end
  end

  it 'redirects me to that post\'s show page when I click on a user\'s post' do
    post = @user.posts[-1]
    click_link post.title
    expect(page).to have_current_path(author_post_path(@user.id, post.id))
  end

  it 'redirects me to the user\'s posts\' index page when I click to see all posts' do
    click_link 'See all posts'
    expect(page).to have_current_path(author_posts_path(@user.id))
  end
end