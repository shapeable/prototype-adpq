Rails.application.routes.draw do
  
  scope "(:locale)", :locale => /en|es/ do
    root 'pages#landing'
    resources :users
    resources :pages
  end
  namespace :api, defaults: { format: 'json' } do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      resources :users do
        collection do
          get 'index'
          get 'show'
          post 'create'
        end
      end
      resources :alarms do
        collection do
          get 'index'
        end
      end
      resources :alarm_categories do
        collection do
          get 'index'
        end
      end
      resources :comments do
        collection do
          get 'index'
          post 'create'
        end
      end
    end
  end

end
