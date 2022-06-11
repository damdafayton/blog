require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  user = 1
  describe "GET /authors/#{user}/posts" do
    it "gets all posts of user #{user}" do
      get author_posts_path(user)
      expect(response).to have_http_status(:ok)
      expect(response.body).to include('Likes:')
      expect(response).to render_template(:index)
    end
  end

  describe "GET /authors/#{user}/posts/2" do
    it "gets 2nd post of user #{user}" do
      get author_post_path(user, 2)
      expect(response).to have_http_status(:ok)
      expect(response.body).to include('Comments:')
      expect(response).to render_template(:show)
    end
  end
end
