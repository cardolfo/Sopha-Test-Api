require 'swagger_helper'

RSpec.describe 'Stores API', type: :request do  

    path '/v1/stores' do    
        post 'Creates a store' do
            tags 'Stores'
            consumes 'application/json'
            parameter name: :store,  in: :body, schema: {
                type: :object,
                properties: {
                    name: { type: :string }
                },
                required: [ 'name']
            }
    
            response '201', 'store created' do
                let(:new_name_store) { Faker::Company.name }
                let(:store) { { name: new_name_store } }
                run_test! do |response|
                  json_response = JSON.parse(response.body)
                  expect(json_response['name']).to eq(new_name_store)
                end 
            end
        end          
    end
    path '/v1/stores/{id}' do    
        get 'Retrieves a store' do
            tags 'Stores'
            produces 'application/json'
            parameter name: :id,  in: :path, type: :integer            

            response '200', 'store found' do
                schema type: :object,
                  properties: {
                    id: { type: :integer },
                    name: { type: :string }
                  },
                  required: [ 'id', 'name']
        
                let(:id) { Store.create(name: Faker::Company.name).id }
                run_test!
              end
        
              response '404', 'store not found' do
                let(:id) { 0 }
                run_test!
              end
        end          
    end
    path '/v1/stores/{id}' do    
      put 'Updates a store' do
          tags 'Stores'
          consumes 'application/json'
          produces 'application/json'
          parameter name: :id,  in: :path, type: :integer            
          parameter name: :store,  in: :body, schema: {
            type: :object,
            properties: {
                name: { type: :string }
            },
            required: [ 'name']
          }

          response '200', 'store updated' do
            schema type: :object,
              properties: {
                id: { type: :integer },
                name: { type: :string }
              },
              required: [ 'id', 'name']
                    
            let(:new_name_store) { Faker::Company.name }              
            let(:id) { Store.create(name: new_name_store).id }
            let(:name_store_updated) {Faker::Company.name}
            let(:store) {  { name: name_store_updated } }
            run_test! do |response|
              json_response = JSON.parse(response.body)
              expect(json_response['name']).to eq(name_store_updated)
            end            
          end
      
          response '404', 'store not found' do
            let(:id) { 0 }
            let(:store) { { name: Faker::Company.name } }
            run_test!
          end
      end          
    end

    path '/v1/stores/{id}' do    
      delete 'Remove a store' do
          tags 'Stores'
          produces 'application/json'
          parameter name: :id,  in: :path, type: :integer 

          response '200', 'store removed' do
            let(:id) { Store.create(name: Faker::Company.name).id }
            run_test!
          end
          
          response '404', 'store not found' do
            let(:id) { 0 }
            let(:store) { { name: Faker::Company.name } }
            run_test!
          end 
      end
    end
end
