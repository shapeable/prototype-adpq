Rails.application.routes.draw do
  
  root 'pages#landing'

  resources :users

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
      end
    end

end
