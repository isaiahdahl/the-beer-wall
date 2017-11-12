Rails.application.routes.draw do
  devise_for :users
  mount Attachinary::Engine => "/attachinary"
  root to: 'pages#home'
  get    "photos/new",      to: "photos#new"
  post   "photos",          to: "photos#create"
  resources :beers do
    collection do                       # collection => no restaurant id in URL
      get 'want', to: "beers#want"
      get 'dont/have', to: "beers#dont_have"
      get 'photo-query', to: "beers#photo_search"
      post 'dont/have', to: "beers#sight"
      get 'have', to: "beers#have"
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
