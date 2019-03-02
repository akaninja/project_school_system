Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"

  get 'my_students', to: "students#my_students" 
  resources :cards
  resources :lists
  resources :teachers
  resources :students do 
    get 'search', on: :collection
    member do
      get 'favorite'
      delete 'favorite', to: "students#unfavorite"
      post 'add_list'
    end
  end 
  resources :cards, only: [:show, :new, :create]
end
