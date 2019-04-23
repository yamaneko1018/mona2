Rails.application.routes.draw do
  root  'users#index'
  resources :user_sessions
  resources :users
  resources :password_resets
 
  resources :users do
    member do
      get :activate
    end
  end
  resources :items
  get 'login' => 'user_sessions#new', :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout
 
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
