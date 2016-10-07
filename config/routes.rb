Rails.application.routes.draw do

	resources :users
	resources :attractions
	resources :rides

	root 'welcome#home'

	get 'users/new', to: 'users#new', as: 'signup'
	get 'signin', to: 'sessions#new'
  post 'sessions/create', to: 'sessions#create'
  get 'signout', to: 'sessions#destroy'

end