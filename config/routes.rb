Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'user_auth'

  mount_devise_token_auth_for 'Admin', at: 'admin_auth'
  as :admin do
    # Define routes for Admin within this block.
  end

  resources :players
  resources :teams
  resources :leagues
  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
