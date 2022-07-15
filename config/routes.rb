Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :test, only: %i[index]

      mount_devise_token_auth_for 'User', at: 'auth', controllers: {
        registrations: 'api/v1/auth/registrations'
      }

      namespace :auth do
        resources :sessions, only: %i[index]
      end

      resources :participants, only: %i[index create destroy]
      resources :progresses, only: %i[index create destroy]
      resources :themes
      resources :works

      patch '/feelings', to: 'feelings#update'

    end
  end
end
