Rails.application.routes.draw do
  resources :dashboards do
    resources :urls do
      member do
        get 'show_url' => 'dashboards#show_url'
        get 'details_url' => 'dashboards#details_url'
      end
    resources :click do
      get 'details_referer' => 'dashboards#details_referer'
    end
    end
  end
  resources :urls
  devise_for :users
  match '/contacts',     to: 'contactforms#new',             via: 'get'
  get 'landing_pages/index'
  root 'landing_pages#index'
  get ':slug' => 'urls#show'
  get ':slug/password' => 'urls#show_password'
  get ':slug/password_digest' => 'urls#password_digest', as: :password_digest
  resources :contactforms, only: [:new, :create]
end
