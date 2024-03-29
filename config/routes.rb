Rails.application.routes.draw do

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
  }

  root 'homes#top'
  get 'home/about' => 'homes#about'
  get '/search', to: 'searches#search'

  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end

  resources :users,only: [:show,:index,:edit,:update] do
    resource :relationships, only: [:create, :destroy]
    get 'relationship/followings' => 'relationships#followings', as: 'followings'
    get 'relationship/followers' => 'relationships#followers', as: 'followers'
  end

  get 'chat/:id' => 'chats#show', as: 'chat'
  resources :chats, only: [:create]

end