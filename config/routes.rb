Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  post '/signin', to: 'user#signin'
  post '/signup', to: 'user#signup'
  namespace :v1 do
    resources :stores, only: %i[show create update destroy]
  end
end
