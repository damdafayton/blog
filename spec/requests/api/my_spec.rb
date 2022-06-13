require 'swagger_helper'

RSpec.describe 'BLOGS API', type: :request do
  path '/authors/2/posts/' do
    get 'Lists all posts of the author' do
      tags 'Post'
      produces 'application/json'
      consumes 'application/json'
      response '200', 'posts retrieved' do
        run_test!
      end
    end
  end

  path '/authors/2/posts/1/comments' do
    get 'Lists all comments of the post' do
      tags 'Comment'
      produces 'application/json'
      consumes 'application/json'
      response '200', 'comments retrieved' do
        run_test!
      end
    end
  end

  path '/authors/2/posts/100/comments' do
    get 'Gives error if comment doesn\'t exist' do
      tags 'Comment'
      produces 'application/json'
      consumes 'application/json'
      response '404', 'comment not found' do
        run_test!
      end
    end
  end

  path '/authors/2/posts/1/comments' do
    post 'Creates new comment' do
      tags 'Comment'
      produces 'application/json'
      consumes 'application/json'
      parameter name: :comment, in: :body, schema: {
        type: :object,
        properties: {
          title: { type: :string },
          text: { type: :string }
        },
        required: %w[title text]
      }

      # needs authorization
      # response '201', 'comment created' do
      #   let(:comment) { { title: 'foo', text: 'bar' } }
      #   run_test!
      # end

      response '422', 'invalid request' do
        let(:comment) { { title: 'foo' } }
        run_test!
      end
    end
  end
end
