Rails.application.routes.draw do
  root 'pages#landing'
  get 'enroll', to: 'pages#enroll'
  
  resources :users

   namespace :api, defaults: { format: 'json' } do
      scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
        resources :users do
          collection do
            get 'index'
          end
        end
      end
    end
end
