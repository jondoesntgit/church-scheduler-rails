Rails.application.routes.draw do
  root 'welcome#index'
  
  resources :events

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :v0, defaults: { format: 'json' } do
    get 'events', to: 'events#index'
  end

end
