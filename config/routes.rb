Rails.application.routes.draw do
  resources :dashboards
  devise_for :users
  get 'landing_pages/index'
  root 'landing_pages#index'
  get ':slug' => 'urls#show'
  resources :urls
end
