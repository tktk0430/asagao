Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/" => "top#index"
  get "about" => "top#about", as: "about"

  resources :members do
    get "search", on: :collection
    resources :entries, only: [:index]
  end

  resource :session, only: [:create, :destroy]
  resource :account, only: [:show, :edit, :update]
  resource :password, only: [:show, :edit, :update]
  resources :articles
  resources :entries
end