Rails.application.routes.draw do
  resources :pokemon_infos
  root 'pokemon_infos#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
