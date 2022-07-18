require 'swagger_helper'

RSpec.describe 'Todos API', type: :request do
  path '/api/v1/todos' do
    post 'Creates a todo' do
      tags 'Todos'
      consumes 'application/json'
      parameter name: :todo, in: :body, schema: { '$ref' => '#/definitions/Todo' }

      response '201', :success do
        let(:todo) { { name: 'Todo', done: false } }
        run_test!
      end

      response '422', :unprocessable_entity do
        let(:todo) { { name: 'Todo' } }
        run_test!
      end
    end

    get 'Retrieves a todo list' do
      tags 'Todos'
      response 200, :success do
        schema '$ref' => '#/definitions/Todos'
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
        schema '$ref' => '#/definitions/Todo'
        let(:id) { Todo.create(name: 'Todo', done: false).id }
        run_test!
      end

      response '404', :not_found do
        let(:id) { 0 }
        run_test!
      end
    end

    put 'Update todo by id' do
      tags 'Todos'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :id, in: :path, type: :integer
      parameter name: :todo, in: :body, schema: { '$ref' => '#/definitions/Todo' }

      response '200', :success do
        let!(:id) { Todo.create(name: 'Todo', done: false).id }
        let(:todo) { { name: 'Todo', done: true } }
        run_test!
      end

      response '404', :not_found do
        let!(:id) { 0 }
        let(:todo) { { name: 'Todo', done: true } }
        run_test!
      end
    end

    delete 'Delete todo by id' do
      tags 'Todos'
      produces 'application/json'
      parameter name: :id, in: :path, type: :integer

      response '204', :no_content do
        let!(:id) { Todo.create(name: 'Todo', done: false).id }
        run_test!
      end

      response '404', :not_found do
        let!(:id) { 0 }
        run_test!
      end
    end
  end
end
