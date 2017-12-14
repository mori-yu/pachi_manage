Rails.application.routes.draw do
  #root to: 'tops#index'
  devise_for :users
  devise_scope :user do
    root :to => "devise/sessions#new"
  end
  resources :balances

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
