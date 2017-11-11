Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :beers do
    collection do                       # collection => no restaurant id in URL
      get 'want', to: "beers#want"
      get 'dont/have', to: "beers#dont_have"
      get    ":id/wanted", to: "beers#wanted"
      patch ':id', to: "beers#add_to_want"
      get 'have', to: "beers#have"
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
