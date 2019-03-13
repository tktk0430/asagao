Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/" => "top#index"
  get "about" => "top#about", as: "about"

  resources :members do
    get "search", on: :collection
  end

  resource :session, only: [:create, :destroy]
end
