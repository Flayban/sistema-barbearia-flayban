Rails.application.routes.draw do
  devise_for :barbeiros
  get 'sessions/new'
  devise_for :clientes
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
  devise_scope :clientes do
    post 'clientes/signed_in' => 'devise/sessions#create'
    get 'clientes/sign_up' => 'devise/registrations#new'
    post 'clientes/sign_out' => 'devise/sessions#destroy'
  end
  # Defines the root path route ("/")
  # root "articles#index"
  root "welcome#index"
end
