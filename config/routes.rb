Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' } #  resources :users
  resources :bibliothecas
  resources :books do
    post :rent, on: :member, to: "books#rent"
    post :return, on: :member, to: "books#return"
  end
  get :mybooks, to: "books#mybooks"

end
