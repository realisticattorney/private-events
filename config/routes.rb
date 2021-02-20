Rails.application.routes.draw do
  resources :enrollments
  resources :event_attendings
  resources :events
  devise_for :users
  resources :users
  root 'events#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
