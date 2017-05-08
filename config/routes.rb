Rails.application.routes.draw do
  get 'welcome/index'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  root 'welcome#index'
  resources :favorites
  resources :accounts
  resources :uploads
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
