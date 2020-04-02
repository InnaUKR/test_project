Rails.application.routes.draw do
  namespace :api, constraints: { format: 'json' } do
    namespace :v1 do
      scope module: :ticket do
        resources :tickets, only: :create
      end
    end
  end
  resources :tickets, only: %i[index show]
end
