require 'rails_helper'

# I can see the user's profile picture.
# I can see the user's username.
# I can see the number of posts the user has written.
# I can see a post's title.
# I can see some of the post's body.
# I can see the first comments on a post.
# I can see how many comments a post has.
# I can see how many likes a post has.
# I can see a section for pagination if there are more posts than fit on the view.
# When I click on a post, it redirects me to that post's show page.

RSpec.describe 'Author Post index page,' do
  before do
    @author = User.find(1)
    visit author_posts_path(@author.id)
  end

  describe 'renders' do
    it 'user\'s profile picture' do
      expect(page).to have_selector('.user-image', count: 1)
    end

    it 'user\'s name' do
      expect(page).to have_content(@author.name)
    end

    it 'number of posts user has written' do
      expect(page).to have_content('Number of posts')
    end

    it 'a post\'s title' do
      post = @author.posts[-1]
      expect(page).to have_content(post.title)
    end

    it 'some of the posts\'s body' do
      post = @author.posts[-1]
      expect(page).to have_content(post.text.slice(0, 200))
    end

    it 'the first comment on a post' do
      expect(page).to have_content('Hi Tom this is a comment!')
    end

    it 'how many comments a post has' do
      post = @author.posts[-1]
      expect(page).to have_content("Comments: #{post.comments_counter}")
    end

    it 'how many likes a post has' do
      post = @author.posts[-1]
      expect(page).to have_content("Likes: #{post.likes_counter}")
    end

    it 'a section for pagination if there are more posts than fit on the view' do
      # click_link post.title
      expect(@author.posts_counter > 2)
      expect(page).to have_selector('#posts-pagination')
    end
  end

  it 'redirects me to that post\'s show page, when I click on a post' do
    post = @author.posts[-1]
    click_link post.title
    expect(page).to have_current_path(author_post_path(@author.id, post.id))
  end
end
