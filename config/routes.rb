Rails.application.routes.draw do

  root to: 'pages#home'

  get '/about' => 'pages#about'

  get 'children/index'

  get 'children/show'

  get 'children/create'

  get 'children/update'

  get 'sections/show'

  get 'sections/index'

  mount Attachinary::Engine => "/attachinary"

  get 'photos/new'

  get 'photos/create'

  get 'photos/update'

  get 'photos/edit'

  get 'photos/destroy'

  # devise_for :users
  devise_for :users, controllers: { registrations: "registrations" }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  resources :profiles, except: [:destroy]

  post 'global_search', to: 'invoices#index'

  resources :invoices, except: [:destroy] do
    member do
      post 'paid', to: 'invoices#paid'
      post 'unpaid', to: 'invoices#unpaid'
    end
    collection do
      post 'markaspaid'
    end
  end

  resources :events
  resources :albums
  resources :sections
  resources :children do
    member do
      post 'approve', to: 'children#approve'
    end
  end

  resources :messages, only: [:new, :create, :index]
end
