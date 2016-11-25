Rails.application.routes.draw do
  devise_for :admins
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root 'static_pages#about'

  get '/ruling_entities/current', to: 'ruling_entities#show_current', as: 'current_ruling_entity'

  resources :ruling_entities, only: [:index, :show] do
    resources :promises, only: [:index]
  end

end
