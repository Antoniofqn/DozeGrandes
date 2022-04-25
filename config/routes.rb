Rails.application.routes.draw do
  get 'matches/index'
  root to: 'matches#index'
  get 'quem_somos', to: 'pages#quem_somos'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
