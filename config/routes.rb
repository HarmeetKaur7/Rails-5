Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root  'articles#index'
  resources :articles do
    collection do
      get 'brandnew' #, only: [:show,:index,:new,:create,:edit,:update,:destroy,:approve]
    end
  end
      get "signup" ,to: "users#new"
  resources :users , except: [:new,:destroy]
  get 'login', to: "sessions#new"
  post 'login', to: "sessions#create"
  delete 'login', to: "sessions#destroy"
  resources :categories , except: [:destroy]
end
