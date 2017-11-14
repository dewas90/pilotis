Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :profiles, except: [:destroy]

  post 'global_search', to: 'invoices#index'
  resources :invoices, except: [:destroy] do
    member do
      post 'paid', to: 'invoices#paid'
      post 'unpaid', to: 'invoices#unpaid'
    end
  end

  root to: 'pages#home'
end
