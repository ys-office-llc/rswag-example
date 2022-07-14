require 'swagger_helper'

RSpec.describe 'Todos API', type: :request do

  path '/api/v1/todos' do

    post 'Todo リストを作成する' do
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

      response 201, 'Todo 作成成功' do
        let(:todo) { { name: '買い物', done: false } }
        run_test!
      end

      # response '422', '不正なリクエスト' do
      #   let(:todo) { { name: '買い物' } }
      #   run_test!
      # end
    end

    get 'Todo 一覧を取得する' do
      tags 'Todos'
      consumes 'application/json'
      produces 'application/json'
      response 200, 'Todo 一覧' do
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
