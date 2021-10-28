Rails.application.routes.draw do
  root to: "welcome#index"
  devise_for :users

  namespace :api do
    namespace :v1 do
      get 'dashboards', to: 'dashboards#index', as: 'dashboard'
      resources :favorites, only: %i( index create )
      delete 'my_list/:type/:id', to: 'favorites#destroy'
      resources :rates, only: [:index, :create]
      resources :searches, only: :index
      resources :sitcoms, only: :show
      resources :movies, only: :show do
        member do
          get 'executions', to: 'executions#show'
          get 'executions', to: 'executions#update'
        end
      end
      resources :recommendations, only: :index
    end
  end
end
