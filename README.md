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


# 参考資料
- [rswagを使ったテストファーストなAPI開発のフローを確認する](https://qiita.com/nakazawaken1/items/1cf12756a9e00f1a8fc4)
- [とにかくRails6でrswagを動かす](https://qiita.com/cheekykorkind/items/6c28832fe23938a92b50)
- [新規Railsプロジェクトの作成手順まとめ](https://qiita.com/yuitnnn/items/b45bba658d86eabdbb26)
