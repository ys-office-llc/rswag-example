# rswag-example

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

# ルーティングテーブル
```ruby
$ bundle exec rails routes
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
        turbo_recede_historical_location GET    /recede_historical_location(.:format)                                                             turbo/native/navigation#recede
        turbo_resume_historical_location GET    /resume_historical_location(.:format)                                                             turbo/native/navigation#resume
       turbo_refresh_historical_location GET    /refresh_historical_location(.:format)                                                            turbo/native/navigation#refresh
           rails_postmark_inbound_emails POST   /rails/action_mailbox/postmark/inbound_emails(.:format)                                           action_mailbox/ingresses/postmark/inbound_emails#create
              rails_relay_inbound_emails POST   /rails/action_mailbox/relay/inbound_emails(.:format)                                              action_mailbox/ingresses/relay/inbound_emails#create
           rails_sendgrid_inbound_emails POST   /rails/action_mailbox/sendgrid/inbound_emails(.:format)                                           action_mailbox/ingresses/sendgrid/inbound_emails#create
     rails_mandrill_inbound_health_check GET    /rails/action_mailbox/mandrill/inbound_emails(.:format)                                           action_mailbox/ingresses/mandrill/inbound_emails#health_check
           rails_mandrill_inbound_emails POST   /rails/action_mailbox/mandrill/inbound_emails(.:format)                                           action_mailbox/ingresses/mandrill/inbound_emails#create
            rails_mailgun_inbound_emails POST   /rails/action_mailbox/mailgun/inbound_emails/mime(.:format)                                       action_mailbox/ingresses/mailgun/inbound_emails#create
          rails_conductor_inbound_emails GET    /rails/conductor/action_mailbox/inbound_emails(.:format)                                          rails/conductor/action_mailbox/inbound_emails#index
                                         POST   /rails/conductor/action_mailbox/inbound_emails(.:format)                                          rails/conductor/action_mailbox/inbound_emails#create
       new_rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/new(.:format)                                      rails/conductor/action_mailbox/inbound_emails#new
      edit_rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/:id/edit(.:format)                                 rails/conductor/action_mailbox/inbound_emails#edit
           rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                                      rails/conductor/action_mailbox/inbound_emails#show
                                         PATCH  /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                                      rails/conductor/action_mailbox/inbound_emails#update
                                         PUT    /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                                      rails/conductor/action_mailbox/inbound_emails#update
                                         DELETE /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                                      rails/conductor/action_mailbox/inbound_emails#destroy
new_rails_conductor_inbound_email_source GET    /rails/conductor/action_mailbox/inbound_emails/sources/new(.:format)                              rails/conductor/action_mailbox/inbound_emails/sources#new
   rails_conductor_inbound_email_sources POST   /rails/conductor/action_mailbox/inbound_emails/sources(.:format)                                  rails/conductor/action_mailbox/inbound_emails/sources#create
   rails_conductor_inbound_email_reroute POST   /rails/conductor/action_mailbox/:inbound_email_id/reroute(.:format)                               rails/conductor/action_mailbox/reroutes#create
rails_conductor_inbound_email_incinerate POST   /rails/conductor/action_mailbox/:inbound_email_id/incinerate(.:format)                            rails/conductor/action_mailbox/incinerates#create
                      rails_service_blob GET    /rails/active_storage/blobs/redirect/:signed_id/*filename(.:format)                               active_storage/blobs/redirect#show
                rails_service_blob_proxy GET    /rails/active_storage/blobs/proxy/:signed_id/*filename(.:format)                                  active_storage/blobs/proxy#show
                                         GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                                        active_storage/blobs/redirect#show
               rails_blob_representation GET    /rails/active_storage/representations/redirect/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations/redirect#show
         rails_blob_representation_proxy GET    /rails/active_storage/representations/proxy/:signed_blob_id/:variation_key/*filename(.:format)    active_storage/representations/proxy#show
                                         GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format)          active_storage/representations/redirect#show
                      rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                                       active_storage/disk#show
               update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                               active_storage/disk#update
                    rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                                    active_storage/direct_uploads#create

Routes for Rswag::Ui::Engine:


Routes for Rswag::Api::Engine:
```
# ローカルからテスト

## index

```bash
$ curl -X GET http://localhost:13000/api/v1/todos
```
```json 
{"status":"SUCCESS","message":"Loaded todos","data":[{"id":2,"name":"掃除","done":false,"created_at":"2022-07-14T05:20:52.900Z","updated_at":"2022-07-14T05:20:52.900Z"},{"id":1,"name":"買い物","done":false,"created_at":"2022-07-14T02:55:29.261Z","updated_at":"2022-07-14T02:55:29.261Z"}]}
```

## show
```bash
$ curl -X GET http://localhost:13000/api/v1/todos/1
```
```json 
{"status":"SUCCESS","message":"Loaded the todo","data":{"id":1,"name":"買い物","done":false,"created_at":"2022-07-14T02:55:29.261Z","updated_at":"2022-07-14T02:55:29.261Z"}}
```

## create
```bash
$ curl -X POST -H "Content-Type: application/json" -d '{"name":"開発", "done":false}' http://localhost:13000/api/v1/todos
```
```json 
{"status":"SUCCESS","data":{"id":3,"name":"開発","done":false,"created_at":"2022-07-14T05:25:15.593Z","updated_at":"2022-07-14T05:25:15.593Z"}}
```

## update
```bash
$ curl -X PUT -H "Content-Type: application/json" -d '{"name":"開発", "done":true}' http://localhost:13000/api/v1/todos/3
```
```json
{"status":"SUCCESS","message":"Updated the todo","data":{"name":"開発","done":true,"id":3,"created_at":"2022-07-14T05:25:15.593Z","updated_at":"2022-07-14T05:26:17.170Z"}}y
```

## destroy
```bash
$ curl -X DELETE -H "Content-Type: application/json" -d '{"name":"開発", "done":true}' http://localhost:13000/api/v1/todos/3
```
```json
{"status":"SUCCESS","message":"Deleted the todo","data":{"id":3,"name":"開発","done":true,"created_at":"2022-07-14T05:25:15.593Z","updated_at":"2022-07-14T05:26:17.170Z"}}
```

## RSpec 実行

## Swagger 仕様自動作成
```ruby
$ RAILS_ENV=test rake rswag:specs:swaggerize
```

# 参考資料
- [Railsで超簡単API](https://qiita.com/k-penguin-sato/items/adba7a1a1ecc3582a9c9)
- [rswagを使ったテストファーストなAPI開発のフローを確認する](https://qiita.com/nakazawaken1/items/1cf12756a9e00f1a8fc4)
- [とにかくRails6でrswagを動かす](https://qiita.com/cheekykorkind/items/6c28832fe23938a92b50)
- [新規Railsプロジェクトの作成手順まとめ](https://qiita.com/yuitnnn/items/b45bba658d86eabdbb26)
