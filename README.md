# rswag での CRUD アプリケーション例

## Gemfile 抜粋

```ruby
gem 'rswag-api'
gem 'rswag-ui'

group :test do
  gem 'rspec-rails'
  gem 'rswag-specs'
end
```

## bundle install 後に行うコマンド
```ruby
bundle exec rails g rswag:api:install
bundle exec rails g rswag:ui:install

bundle exec rails generate rspec:install

RAILS_ENV=test bundle exec rails g rswag:specs:install
RAILS_ENV=test rake rswag:specs:swaggerize
```
キャプチャ（いただきもの）
![68747470733a2f2f71696974612d696d6167652d73746f72652e73332e61702d6e6f727468656173742d312e616d617a6f6e6177732e636f6d2f302f3234373538342f34663464666631332d386235302d656438632d623738352d3261656466386261386335632e706e67](https://user-images.githubusercontent.com/31363256/178884672-3b0598ad-100b-4faa-9082-16ee7a197cda.png)

# ルーティングテーブル（抜粋）
```ruby
                                  Prefix Verb   URI Pattern                                                                                       Controller#Action
                                rswag_ui        /api-docs                                                                                         Rswag::Ui::Engine
                               rswag_api        /api-docs                                                                                         Rswag::Api::Engine
                            api_v1_todos GET    /api/v1/todos(.:format)                                                                           api/v1/todos#index
                                         POST   /api/v1/todos(.:format)                                                                           api/v1/todos#create
                         new_api_v1_todo GET    /api/v1/todos/new(.:format)                                                                       api/v1/todos#new
                        edit_api_v1_todo GET    /api/v1/todos/:id/edit(.:format)                                                                  api/v1/todos#edit
                             api_v1_todo GET    /api/v1/todos/:id(.:format)                                                                       api/v1/todos#show
                                         PATCH  /api/v1/todos/:id(.:format)                                                                       api/v1/todos#update
                                         PUT    /api/v1/todos/:id(.:format)                                                                       api/v1/todos#update
                                         DELETE /api/v1/todos/:id(.:format)                                                                       api/v1/todos#destroy
```
# ローカルからテスト

## index

```bash
curl -X GET http://localhost:13000/api/v1/todos
```
```json 
[{"id":2,"name":"掃除","done":false,"created_at":"2022-07-14T05:20:52.900Z","updated_at":"2022-07-14T05:20:52.900Z"},{"id":1,"name":"買い物","done":false,"created_at":"2022-07-14T02:55:29.261Z","updated_at":"2022-07-14T02:55:29.261Z"}]
```

## show
```bash
curl -X GET http://localhost:13000/api/v1/todos/1
```
```json 
{"id":1,"name":"買い物","done":false,"created_at":"2022-07-14T02:55:29.261Z","updated_at":"2022-07-14T02:55:29.261Z"}
```

## create
```bash
curl -X POST -H "Content-Type: application/json" -d '{"name":"開発", "done":false}' http://localhost:13000/api/v1/todos
```
```json 
{"id":3,"name":"開発","done":false,"created_at":"2022-07-14T05:25:15.593Z","updated_at":"2022-07-14T05:25:15.593Z"}
```

## update
```bash
curl -X PUT -H "Content-Type: application/json" -d '{"name":"開発", "done":true}' http://localhost:13000/api/v1/todos/2
```
```json
{"name":"開発","done":true,"id":2,"created_at":"2022-07-14T05:20:52.900Z","updated_at":"2022-07-14T12:15:25.736Z"}
```

## destroy
```bash
curl -X DELETE -H "Content-Type: application/json" http://localhost:13000/api/v1/todos/1
```
```json
```

## RSpec 実行
```ruby
bundle exec rspec spec/requests/api/v1/todos_spec.rb 
```
```text
.........

Finished in 0.11434 seconds (files took 0.58668 seconds to load)
9 examples, 0 failures
```

## Swagger 仕様自動作成
```ruby
RAILS_ENV=test rake rswag:specs:swaggerize
```

# 参考資料
- [OpenAPIを活用したスキーマの自動生成や型安全な開発について紹介](https://zenn.dev/media_engine/articles/openapi-based-scheme-driven-development)
- [Rails APIのエラーレスポンスを定義する](https://tech.pepabo.com/2021/03/15/rails-api-error-response/)
- [【Rails】APIモードで使えるHTTPステータスコードのシンボルまとめ](https://qiita.com/terufumi1122/items/997e24dde87f807e3944)
- [Railsで超簡単API](https://qiita.com/k-penguin-sato/items/adba7a1a1ecc3582a9c9)
- [rswagを使ったテストファーストなAPI開発のフローを確認する](https://qiita.com/nakazawaken1/items/1cf12756a9e00f1a8fc4)
- [とにかくRails6でrswagを動かす](https://qiita.com/cheekykorkind/items/6c28832fe23938a92b50)
- [新規Railsプロジェクトの作成手順まとめ](https://qiita.com/yuitnnn/items/b45bba658d86eabdbb26)
- [Documenting Ruby on Rails APIs Using rswag Gem](https://betterprogramming.pub/documenting-ruby-on-rails-apis-using-rswag-gem-48c92e11ea30)
- https://github.com/ruslantolstov/rswag-example/blob/master/spec/requests/api/backoffice/articles_spec.rb
- [Using query parameters + body parameters in a single request? #142](https://github.com/rswag/rswag/issues/142)
