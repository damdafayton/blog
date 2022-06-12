require 'rails_helper'

# I can see the post's title.
# I can see who wrote the post.
# I can see how many comments it has.
# I can see how many likes it has.
# I can see the post body.
# I can see the username of each commentor.
# I can see the comment each commentor left.

RSpec.describe 'Author Post show page,' do
  before do
    @author = User.find(1)
    @post = @author.posts[-1]
    visit author_post_path(@author.id, @post.id)
  end

  describe 'renders' do
    it 'post\'s title' do
      expect(page).to have_content(@post.title)
    end

    it 'who wrote the post' do
      expect(page).to have_content(@post.author.name)
    end

    it 'how many comments it has' do
      expect(page).to have_content("Comments: #{@post.comments_counter}")
    end

    it 'how many likes it has' do
      expect(page).to have_content("Likes: #{@post.likes_counter}")
    end

    it 'the post body' do
      expect(page).to have_content(@post.text)
    end

    it 'name of each commentor' do
      commentor = @post.comments[-1].author.name
      expect(page).to have_content(commentor)
    end

    it 'comment of each commentor' do
      comment = @post.comments[-1].text
      expect(page).to have_content(comment)
    end
  end
end
