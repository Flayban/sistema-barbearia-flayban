Rails.application.routes.draw do
  get 'welcome/index'
  get 'welcome/new'
  get 'welcome/creat'
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
