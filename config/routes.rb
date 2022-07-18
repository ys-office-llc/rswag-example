Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  namespace :api do
    namespace :v1 do
      resources :todos
    end
  end

  get '/swagger', to: 'swagger#index'
  get '/viron_authtype', to: 'viron#viron_authtype'
  get '/viron', to: 'viron#viron'
end
