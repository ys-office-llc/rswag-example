class SwaggerController < ApplicationController
  def index
    render json: {
      "swagger": "2.0",
      "info": {
        "title": "Todo API V1",
        "version": "v1"
      },
      "consumes": [
        "application/json"
      ],
      "produces": [
        "application/json"
      ],
      "paths": {
        "/viron": {
          "get": {
            "summary": "エンドポイント全体情報取得",
            "operationId": "viron#index",
            "responses": {
              "200": {
                "description": "success",
                "schema": {
                  "$ref": "#/definitions/Viron"
                }
              }
            }
          }
        },
        "/viron_authtype": {
          "get": {
            "summary": "認証方式一覧",
            "operationId": "viron_authtype#index",
            "responses": {
              "200": {
                "description": "success",
                "schema": {
                  "$ref": "#/definitions/VironAuthtype"
                }
              }
            }
          }
        },
        "/swagger.json": {
          "get": {
            "summary": "swagger.json 取得",
            "operationId": "swagger#index",
            "responses": {
              "200": {
                "description": "success",
                "schema": {
                  "type": "object"
                }
              },
              "500": {
                "description": "Internal Server Error"
              }
            }
          }
        },
        "/api/v1/todos": {
          "post": {
            "summary": "Creates a todo",
            "tags": [
              "Todos"
            ],
            "consumes": [
              "application/json"
            ],
            "parameters": [
              {
                "name": "todo",
                "in": "body",
                "schema": {
                  "$ref": "#/definitions/Todo"
                }
              }
            ],
            "responses": {
              "201": {
                "description": "success"
              },
              "422": {
                "description": "unprocessable_entity"
              }
            }
          },
          "get": {
            "summary": "Retrieves a todo list",
            "tags": [
              "Todos"
            ],
            "responses": {
              "200": {
                "description": "success",
                "schema": {
                  "$ref": "#/definitions/Todos"
                }
              }
            }
          }
        },
        "/api/v1/todos/{id}": {
          "get": {
            "summary": "Retrieves a todo",
            "tags": [
              "Todos"
            ],
            "produces": [
              "application/json"
            ],
            "parameters": [
              {
                "name": "id",
                "in": "path",
                "type": "integer",
                "required": true
              }
            ],
            "responses": {
              "200": {
                "description": "success",
                "schema": {
                  "$ref": "#/definitions/Todo"
                }
              },
              "404": {
                "description": "not_found"
              }
            }
          },
          "put": {
            "summary": "Update todo by id",
            "tags": [
              "Todos"
            ],
            "consumes": [
              "application/json"
            ],
            "produces": [
              "application/json"
            ],
            "parameters": [
              {
                "name": "id",
                "in": "path",
                "type": "integer",
                "required": true
              },
              {
                "name": "todo",
                "in": "body",
                "schema": {
                  "$ref": "#/definitions/Todo"
                }
              }
            ],
            "responses": {
              "200": {
                "description": "success"
              },
              "404": {
                "description": "not_found"
              }
            }
          },
          "delete": {
            "summary": "Delete todo by id",
            "tags": [
              "Todos"
            ],
            "produces": [
              "application/json"
            ],
            "parameters": [
              {
                "name": "id",
                "in": "path",
                "type": "integer",
                "required": true
              }
            ],
            "responses": {
              "204": {
                "description": "no_content"
              },
              "404": {
                "description": "not_found"
              }
            }
          }
        }
      },
      "definitions": {
        "Viron": {
          "required": [
            "name",
            "color",
            "thumbnail",
            "tags",
            "pages"
          ],
          "additionalProperties": false,
          "properties": {
            "name": {
              "type": "string"
            },
            "color": {
              "type": "string"
            },
            "thumbnail": {
              "type": "string"
            },
            "tags": {
              "type": "string"
            },
            "pages": {
              "type": "string"
            }
          }
        },
        "VironAuthtype": {
          "type": "array",
          "items": {
            "$ref": "#/definitions/AuthType"
          }
        },
        "AuthType": {
          "required": [
            "type",
            "url",
            "method",
            "provider"
          ],
          "additionalProperties": false,
          "properties": {
            "type": {
              "type": "string"
            },
            "url": {
              "type": "string"
            },
            "method": {
              "type": "string"
            },
            "provider": {
              "type": "string"
            }
          }
        },
        "ErrorsObject": {
          "type": "object",
          "properties": {
            "errors": {
              "$ref": "#/definitions/ErrorsMap"
            }
          }
        },
        "ErrorsMap": {
          "type": "object",
          "additionalProperties": {
            "type": "array",
            "items": {
              "type": "string"
            }
          }
        },
        "Todo": {
          "type": "object",
          "properties": {
            "name": {
              "type": "string"
            },
            "done": {
              "type": "boolean"
            }
          },
          "required": [
            "name",
            "done"
          ]
        },
        "Todos": {
          "type": "array",
          "items": {
            "$ref": "#/definitions/Todo"
          }
        }
      }
    }
  end
end
