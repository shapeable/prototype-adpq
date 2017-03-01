Rails.application.routes.draw do
  root 'pages#landing'
  get 'enroll', to: 'pages#enroll'
  get 'dashboard', to: 'pages#dashboard'
  resources :users

   namespace :api, defaults: { format: 'json' } do
      scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
        resources :users do
          collection do
            get 'index'
            post 'create'
          end
        end
      end
    end

end
