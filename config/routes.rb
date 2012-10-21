Household::Application.routes.draw do

  resources :balance_utilisateurs

  resources :balances

  resources :mouvement_recurrents

  resources :monnaies
  get "mouvements/new_paiements", to: "mouvements#new_paiements", as: :new_paiements
  get "mouvements/new_revenus", to: "mouvements#new_revenus", as: :new_revenus
  get "mouvements/edit_paiements", to: "mouvements#edit_paiements", as: :edit_paiements
  get "mouvements/edit_revenus", to: "mouvements#edit_revenus", as: :edit_revenus
  post "mouvements/create_mouvements", to: "mouvements#create_mouvements", as: :create_mouvements
  put "mouvements/update_mouvements", to: "mouvements#update_mouvements", as: :update_mouvements
  resources :mouvements


  resources :type_de_mouvements

  devise_for :utilisateurs

  get "/test", to: "test#index"
  root to: "home#index"
end
