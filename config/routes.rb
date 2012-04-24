Library::Application.routes.draw do

  resources :users
  resource :session
  match 'sign_out', :to => 'sessions#destroy', :as => "sign_out"

  resources :books do
    collection do
      get :search
    end
    resources :reservations, only: [:create, :new] do
      member do
        put :free
      end
    end
    resources :tags
  end

  resources :tags

  root :to => 'books#index'

end
