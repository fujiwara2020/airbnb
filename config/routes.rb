Rails.application.routes.draw do
  devise_for :users, controllers: {   registrations: 'users/registrations',
  sessions: 'users/sessions' }

  root to: 'home#top'
  get 'users/show'

  resources :rooms do
  resources :bookings
  end

end
