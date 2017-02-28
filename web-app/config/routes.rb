Rails.application.routes.draw do
  root 'pages#landing'
  get 'enroll', to: 'pages#enroll'
  resources :users
end
