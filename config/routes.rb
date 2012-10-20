Household::Application.routes.draw do

  resources :balance_utilisateurs

  resources :balances

  resources :mouvement_recurrents

  resources :monnaies

  resources :mouvements do
    member do
      get :ajout_paiements
      get :ajout_revenus
      post :submit_paiements
      post :submit_revenus
    end
  end

  resources :type_de_mouvements

  devise_for :utilisateurs

  get "/test", to: "test#index"
  root to: "home#index"
end
