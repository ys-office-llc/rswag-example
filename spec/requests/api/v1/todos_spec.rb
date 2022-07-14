require 'swagger_helper'

RSpec.describe 'Todos API', type: :request do

  path '/api/v1/todos' do

    post 'Creates a todo' do
      tags 'Todos'
      consumes 'application/json'
      parameter name: :todo, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          done: { type: :boolean }
        },
        required: [ 'name', 'done' ]
      }

      response 201, 'OK' do
        let(:todo) { { name: '買い物', done: false } }
        run_test!
      end

      response 422, 'Unprocessable Entity' do
        let(:todo) { { name: '買い物' } }
        run_test!
      end
    end

    get 'Get a todo list' do
      tags 'Todos'
      consumes 'application/json'
      produces 'application/json'
      response 200, 'OK' do
        schema type: :array, items: {
          type: :object,
          properties: {
            name: { type: :string },
            done: { type: :boolean },
          },
          required: [:name, :done]
        }
        run_test!
      end
    end
  end
end
