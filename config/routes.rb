Rails.application.routes.draw do
  devise_for :admins
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root 'ruling_entities#show_current'
  resources :ruling_entities, only: [:index, :show]
  get '/faq' => 'static_pages#faq', as: :faq
end
