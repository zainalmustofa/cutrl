Rails.application.routes.draw do
  resources :dashboards do
    get :urls
    get :details_url
  end
  devise_for :users
  get 'landing_pages/index'
  root 'landing_pages#index'
  get ':slug' => 'urls#show'
  resources :urls
end
