Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'  
  resources :users, param: :_username
  post '/auth/login', to: 'authentication#login'
  get '/*a', to: 'application#not_found'
  namespace :v1 do    
    resources :stores, only: [:show, :create, :update, :destroy] 
  end
end
