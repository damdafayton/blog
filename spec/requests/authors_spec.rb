require 'rails_helper'
# status | redirect | include | render: deprecated

RSpec.describe 'Authors', type: :request do
  describe 'GET /authors' do
    it 'shows index of all authors' do
      get authors_path
      expect(response).to have_http_status(:ok)
      expect(response.body).to include('Number of posts')
      expect(response).to render_template(:index)
    end
  end

  describe 'GET /authors/2' do
    it 'shows single user' do
      get author_path(2)
      expect(response).to have_http_status(:ok)
      expect(response.body).to include('Bio:')
      expect(response).to render_template(:show)
    end
  end
end
