Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :v0, defaults: { format: 'json' } do
    get 'things', to: 'things#index'
  end
end
