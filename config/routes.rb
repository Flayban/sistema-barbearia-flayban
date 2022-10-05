Rails.application.routes.draw do
  resources :services
  get 'welcome/index'
  get 'welcome/new'
  get 'welcome/create'
  resources :barbeiros
  resources :clientes do
    resources :agendamentos
  end
  resources :welcome
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "welcome#index"
end
