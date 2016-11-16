Rails.application.routes.draw do
  devise_for :admins
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root 'ruling_parties#show_current'

  get '/faq' => 'static_pages#faq', as: :faq

  resources :ruling_parties, only: [:index, :show]

end
