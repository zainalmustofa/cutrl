Rails.application.routes.draw do
  get 'landing_pages/index'
  root 'landing_pages#index'
  get ':slug' => 'urls#show'
  resources :urls
end
