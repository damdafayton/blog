require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /users/7/posts' do
    it 'gets all posts of user 7' do
      get user_posts_path(7)
      expect(response).to have_http_status(:ok)
      expect(response.body).to include('POSTS INDEX')
      expect(response).to render_template(:index)
    end
  end

  describe 'GET /users/7/posts/2' do
    it 'gets 2nd post of user 7' do
      get user_post_path(7, 2)
      expect(response).to have_http_status(:ok)
      expect(response.body).to include('POST ID')
      expect(response).to render_template(:show)
    end
  end
end
