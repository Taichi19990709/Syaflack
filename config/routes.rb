Rails.application.routes.draw do
  #get 'posts/search', to: 'posts#search'
  devise_for :users, controllers: {
  omniauth_callbacks: "omniauth_callbacks"
}
  resources :posts do
    get 'search', :on => :collection
  end
  resources :schedules, except: :new
  get 'users/calendar'
  root 'home#index'
  resources :users
  get '/schedules/:newdate/new/', to: 'schedules#new', as: 'new_schedule'
end
