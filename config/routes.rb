Rails.application.routes.draw do

  get '/presist', to: 'tokens#persist'

  resources :tokens, only: [:create]
 
  
  resources :tasks
  resources :lists
  resources :projects
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
