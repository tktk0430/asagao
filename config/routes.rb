Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/" => "top#index"
  get "about" => "top#about", as: "about"
  (1..18).each do |n|
    get "lesson/step#{n}/:name"=>"lesson#step#{n}"
  end

  resources :members do
    get "search", on: :collection
  end
end
