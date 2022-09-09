Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root  'articles#index'
  resources :articles #, only: [:show,:index,:new,:create,:edit,:update,:destroy]
  get "signup" ,to: "users#new"
  resources :users , except: [:new]
  get 'login', to: "sessions#new"
  post 'login', to: "sessions#create"
  delete 'login', to: "sessions#destroy"
  require 'sidekiq/web'

  mount Sidekiq::Web => '/sidekiq' #to display dashboard on the web 
end

