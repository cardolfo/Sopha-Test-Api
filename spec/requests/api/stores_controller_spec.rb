require 'swagger_helper'

RSpec.describe 'Stores API', type: :request do
  path '/v1/stores' do
    post 'Creates a store' do
      tags 'Stores'

      json_format
      authenticated

      parameter name: :store, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string }
        },
        required: ['name']
      }

      response '201', 'store created' do
        add_auth_header
        let(:new_name_store) { Faker::Company.name }
        let(:store) { { name: new_name_store } }
        run_test! do |response|
          json_response = JSON.parse(response.body)
          expect(json_response['name']).to eq(new_name_store)
        end
      end
      response '401', 'Creates a store not authorized' do
        add_auth_header_not_authorized
        let(:new_name_store) { Faker::Company.name }
        let(:store) { { name: new_name_store } }
        run_test!
      end
    end
  end
  path '/v1/stores/{id}' do
    get 'Retrieves a store' do
      tags 'Stores'

      json_format
      authenticated

      parameter name: :id, in: :path, type: :integer

      response '200', 'store found' do
        add_auth_header
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 name: { type: :string }
               },
               required: %w[id name]

        let(:store) { create(:store, user: create(:user)) }
        let(:id) { store.id }
        run_test!
      end

      response '204', 'store not found' do
        add_auth_header
        let(:id) { 0 }
        run_test!
      end

      response '401', 'Retrieves a store not authorized' do
        add_auth_header_not_authorized
        let(:id) { 0 }
        run_test!
      end
    end
  end
  path '/v1/stores/{id}' do
    put 'Updates a store' do
      tags 'Stores'

      json_format
      authenticated

      parameter name: :id, in: :path, type: :integer
      parameter name: :store, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string }
        },
        required: ['name']
      }

      response '200', 'store updated' do
        add_auth_header
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 name: { type: :string }
               },
               required: %w[id name]
        let(:store_created) { create(:store, user: create(:user)) }
        let(:id) { store_created.id }
        let(:new_name_store) { store_created.name }
        let(:name_store_updated) { Faker::Company.name }
        let(:store) { { name: name_store_updated } }
        run_test! do |response|
          json_response = JSON.parse(response.body)
          expect(json_response['name']).to eq(name_store_updated)
        end
      end

      response '204', 'store not found' do
        add_auth_header
        let(:id) { 0 }
        let(:store) { { name: Faker::Company.name } }
        run_test!
      end
      response '401', 'Updates a store not authorized' do
        add_auth_header_not_authorized
        let(:id) { 0 }
        let(:store) { { name: Faker::Company.name } }
        run_test!
      end
    end
  end
  path '/v1/stores/{id}' do
    delete 'Remove a store' do
      tags 'Stores'

      json_format
      authenticated

      parameter name: :id, in: :path, type: :integer

      response '200', 'store removed' do
        add_auth_header
        let(:store_created) { create(:store) }
        let(:id) { store_created.id }
        run_test! do |response|
          json_response = JSON.parse(response.body)
          expect(json_response['message']).to eq('Removed')
        end
      end

      response '204', 'store not found' do
        add_auth_header
        let(:id) { 0 }
        let(:store) { { name: Faker::Company.name } }
        run_test!
      end

      response '401', 'Remove a storee not authorized' do
        add_auth_header_not_authorized
        let(:id) { 0 }
        let(:store) { { name: Faker::Company.name } }
        run_test!
      end
    end
  end
end
