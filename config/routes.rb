Rails.application.routes.draw do
  #root to: 'tops#index'
  devise_for :users
  devise_scope :user do
    root :to => "devise/sessions#new",
    passwords: 'users/passwords'
  end

  resources :balances do
    collection do
      get 'result'
      get 'ranking'
    end
  end

  get 'event', to: 'events#event'

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
