Rails.application.routes.draw do
  require 'sidekiq/web'

  root to: "phones#index"

  mount Sidekiq::Web => '/sidekiq'
  mount ActionCable.server => '/cable'

  resources :phones, only: %i(index) do
    get 'get_info', on: :collection
  end
end
