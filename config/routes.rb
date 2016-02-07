Rails.application.routes.draw do
  resources :articles do
    resources :comments
  end
  root 'articles#index'
  get '/search', to: 'articles#search'
end
