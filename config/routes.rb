Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
  resources :teachers
  resources :students do 
    get 'search', on: :collection
  end 
  resources :cards, only: [:show, :new, :create]
end
