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
                let(:store) { { name: Faker::Company.name} }
                run_test!
            end
        end          
    end
     
end
