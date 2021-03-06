Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'battle', to: 'pages#battle'
  resources :pokemons do 
    resources :decks , only: [:new, :create]
  end

  resources :decks, only: [:show, :index, :destroy, :update]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
