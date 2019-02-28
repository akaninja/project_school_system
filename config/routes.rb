Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"

  get 'my_students', to: "students#my_students" 

  resources :teachers
  resources :students do 
    get 'search', on: :collection
    get 'favorite', on: :member
    delete 'favorite', to: "students#unfavorite", on: :member
  end 
  resources :cards, only: [:show, :new, :create]
end
