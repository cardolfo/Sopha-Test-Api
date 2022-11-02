require 'swagger_helper'

RSpec.describe 'Users API', type: :request do
  path '/signin' do
    post 'Sign in User' do
      tags 'User'

      json_format

      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          username: { type: :string },
          password: { type: :string }
        },
        required: %w[name password]
      }
      response '200', 'Sign in successful' do
        let(:user_created) { create(:user) }
        let(:user) { { username: user_created.username, password: user_created.password } }
        run_test!
      end
    end
  end
  path '/signup' do
    post 'Sign up User' do
      tags 'User'

      json_format

      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          username: { type: :string },
          password: { type: :string },
          email: { type: :string }
        },
        required: %w[name password]
      }
      response '200', 'Sign up successful' do
        let(:user_created) { build(:user) }
        let(:user) { { username: user_created.username, password: user_created.password, email: user_created.email } }
        run_test!
      end
    end
  end
end
