require 'swagger_helper'

RSpec.describe 'Todos API', type: :request do

  path '/api/v1/todos' do

    post 'Creates a todo' do
      tags 'Todos'
      consumes 'application/json'
      parameter name: :todo, in: :body, schema: { '$ref' => '#/components/schemas/todo' }

      response 201, :success do
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
      response 200, :success do
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

  path '/api/v1/todos/{id}' do

    get 'Retrieves a todo' do
      tags 'Todos'
      produces 'application/json'
      parameter name: :id, in: :path, type: :integer

      response '200', :success do
        schema type: :object,
          properties: {
            id: { type: :integer },
            name: { type: :string },
            done: { type: :boolean }
          },
          required: [ 'id', 'name', 'done' ]

        let(:id) { Todo.create(name: 'トイレ掃除', done: false).id }
        run_test!
      end

      response '404', 'Not Found' do
        let(:id) { 0 }
        run_test!
      end

      # response '406', 'unsupported accept header' do
      #   let(:'Accept') { 'application/foo' }
      #   run_test!
      # end
    end

    put 'Update todo by id' do
      tags 'Todos'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :id, in: :path, type: :integer
      parameter name: :todo, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          done: { type: :boolean }
        },
        required: [:name, :done]
      }

      response '200', :success do
        let!(:id) { Todo.create(name: '掃除', done: false).id }
        let(:todo) { { name: '掃除', done: true } }
        run_test!
      end

      response '404', :not_found do
        let!(:id) { 0 }
        let(:todo) { { name: '掃除', done: true } }
        run_test!
      end
    end

    delete 'Delete todo by id' do
      tags 'Todos'
      # consumes 'application/json'
      produces 'application/json'
      parameter name: :id, in: :path, type: :integer

      response '204', :no_content do
        let!(:id) { Todo.create(name: '掃除', done: false).id }
        run_test!
      end

      response '404', :not_found do
        let!(:id) { 0 }
        run_test!
      end
    end
  end
end
