Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'dashboards/index'
    end
  end
  namespace :api do
    namespace :v1 do
      get 'recommendations/index'
    end
  end
  namespace :api do
    namespace :v1 do
      get 'executions/create'
      get 'executions/update'
    end
  end
  namespace :api do
    namespace :v1 do
      get 'sitcoms/show'
    end
  end
  namespace :api do
    namespace :v1 do
      get 'movies/show'
    end
  end
  namespace :api do
    namespace :v1 do
      get 'searches/index'
    end
  end
  namespace :api do
    namespace :v1 do
      get 'rates/index'
      get 'rates/create'
    end
  end
  namespace :api do
    namespace :v1 do
      get 'favorites/index'
      get 'favorites/create'
      get 'favorites/destroy'
    end
  end
  root to: "welcome#index"
  devise_for :users

end
