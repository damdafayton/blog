require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /authors/1/posts' do
    it 'gets all posts of user 1' do
      get author_posts_path(1)
      expect(response).to have_http_status(:ok)
      expect(response.body).to include('Likes:')
      expect(response).to render_template(:index)
    end
  end

  describe 'GET /authors/1/posts/2' do
    it 'gets 2nd post of user 1' do
      get author_post_path(1, 2)
      expect(response).to have_http_status(:ok)
      expect(response.body).to include('Comments:')
      expect(response).to render_template(:show)
    end
  end
end
