# config/initializers/cors.rb
Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins ['*'] # 許可するhost
    resource '/api/*', headers: :any, methods: [:get, :post, :delete, :put, :options], expose: [
      'Origin', 'Content-Type', 'Content-Disposition', 'Accept', 'Authorization',
      'X-Requested-With', 'X-Authorization',
      'X-Pagination-Limit', 'X-Pagination-Total-Pages', 'X-Pagination-Current-Page',
    ]
    resource '/viron', headers: :any, methods: [:get]
    resource '/viron_authtype', headers: :any, methods: [:get]
    resource '/swagger.json', headers: :any, methods: [:get]
  end
end
