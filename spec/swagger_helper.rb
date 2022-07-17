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
      swagger: '2.0',
      info: {
        title: 'Todo API V1',
        version: 'v1'
      },
      # Viron からの API リクエスト MIME タイプ
      consumes: ['application/json'],
      produces: ['application/json'],
      paths: {
        # 必須API - グローバルメニューの取得
        '/viron': {
          get: {
            summary: 'エンドポイント全体情報取得',
            operationId: 'viron#index',
            responses: {
              '200': {
                description: :success,
                schema: {
                  '$ref' => '#/definitions/Viron'
                }
              }
            }
          }
        },
        #  必須 API - 認証方式の取得
        '/viron_authtype': {
          get: {
            summary: '認証方式一覧',
            operationId: 'viron_authtype#index',
            responses: {
              '200': {
                description: :success,
                schema: {
                  '$ref': '#/definitions/VironAuthtype'
                }
              }
            }
          }
        },
        # 必須API - swagger 取得（API 定義）
        '/swagger.json': {
          get: {
            summary: 'swagger.json 取得',
            operationId: 'swagger#index',
            responses: {
              '200': {
                description: :success,
                schema: {
                  type: 'object'
                }
              },
              '500': {
                description: 'Internal Server Error'
              }
            }
          }
        }
      },
      definitions: {
        Viron: {
          required: [
            'name',
            'color',
            'thumbnail',
            'tags',
            'pages'
          ],
          additionalProperties: false,
          properties: {
            name: {
              type: 'string'
            },
            color: {
              type: 'string'
            },
            thumbnail: {
              type: 'string'
            },
            tags: {
              type: 'string'
            },
            pages: {
              type: 'string'
            }
          }
        },
        # 認証方法の取得で使ってる定義
        VironAuthtype: {
          type: 'array',
          items: {
            '$ref' => '#/definitions/AuthType'
          }
        },
        AuthType: {
          required: [
            'type',
            'url',
            'method',
            'provider'
          ],
          additionalProperties: false,
          properties: {
            type: {
              type: 'string'
            },
            url: {
              type: 'string'
            },
            method: {
              type: 'string'
            },
            provider: {
              type: 'string'
            }
          }
        },
        errors_object: {
          type: 'object',
          properties: {
            errors: { '$ref' => '#/definitions/errors_map' }
          }
        },
        errors_map: {
          type: 'object',
          additionalProperties: {
            type: 'array',
            items: { type: 'string' }
          }
        },
        todo: {
          type: :object,
          properties: {
            name: { type: :string },
            done: { type: :boolean }
          },
          required: %w[name done]
        },
        todos: {
          type: 'array',
          items: {
            '$ref' => '#/definitions/todo'
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
