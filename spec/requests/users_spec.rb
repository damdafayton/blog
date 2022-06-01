require 'rails_helper'
# status | redirect | include | render: deprecated

RSpec.describe 'Users', type: :request do
  describe 'GET /users' do
    it 'shows index of all users' do
      get users_path
      expect(response).to have_http_status(:ok)
      expect(response.body).to include('INDEX')
      expect(response).to render_template(:index)
    end
  end

  describe 'GET /users/7' do
    it 'shows single user' do
      get user_path(7)
      expect(response).to have_http_status(:ok)
      expect(response.body).to include('USER ID')
      expect(response).to render_template(:show)
    end
  end
end
