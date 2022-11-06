# frozen_string_literal: true

require 'rails_helper'

RSpec.configure do |config|
  # Specify a root folder where Swagger JSON files are generated
  # NOTE: If you're using the rswag-api to serve API descriptions, you'll need
  # to ensure that it's configured to serve Swagger from the same folder
  config.swagger_root = Rails.root.join('swagger').to_s

  # Define one or more Swagger documents and provide global metadata for each one
  # When you run the 'rswag:specs:swaggerize' rake task, the complete Swagger will
  # be generated at the provided relative path under swagger_root
  # By default, the operations defined in spec files are added to the first
  # document below. You can override this behavior by adding a swagger_doc tag to the
  # the root example_group in your specs, e.g. describe '...', swagger_doc: 'v2/swagger.json'
  config.swagger_docs = {
    'v1/swagger.yaml' => {
      openapi: '3.0.1',
      info: {
        title: 'Sopha API',
        version: 'v1'
      },
      paths: {
        '/v1/stores': {
          post: {
            security: {
              bearerAuth: [
                'Bearer Authentication'
              ]
            }
          },
          get: {
            security: {
              bearerAuth: [
                'Bearer Authentication'
              ]
            }
          },
          put: {
            security: {
              bearerAuth: [
                'Bearer Authentication'
              ]
            }
          },
          delete: {
            security: {
              bearerAuth: [
                'Bearer Authentication'
              ]
            }
          }
        }
      },
      servers: [
        {
          url: 'http://ec2-3-89-242-61.compute-1.amazonaws.com',
          variables: {
            defaultHost: {
              default: 'ec2-3-89-242-61.compute-1.amazonaws.com'
            }
          }
        }
      ],
      components: {
        securitySchemes: {
          bearerAuth: {
            name: 'Bearer Authentication',
            type: 'http',
            scheme: 'bearer',
            bearerFormat: 'JWT'
          }
        }
      }
    }
  }

  # Specify the format of the output Swagger file when running 'rswag:specs:swaggerize'.
  # The swagger_docs configuration option has the filename including format in
  # the key, this may want to be changed to avoid putting yaml in json files.
  # Defaults to json. Accepts ':json' and ':yaml'.
  config.swagger_format = :yaml
end

def add_auth_header
  let(:user) { build(:user) }
  let(:Authorization) { Services::UserService.signup(user) }
end

def add_auth_header_not_authorized
  let(:Authorization) { '0' }
end

def authenticated
  parameter name: :Authorization,
            in: :header,
            type: :string,
            default: 'Token value',
            description: 'The user JWT token provided to you'
end

def json_format
  consumes 'application/json'
  produces 'application/json'
end
