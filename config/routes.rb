Rails.application.routes.draw do
  get 'groups/index'
  get 'groups/show'
  get 'groups/edit'
  get 'relationships/followings'
  get 'relationships/followers'
  get 'book_comments/create'
  get 'book_comments/destroy'
  get 'favorites/create'
  get 'favorites/destroy'
  devise_for :users
  root to: 'homes#top'
  get 'home/about' => 'homes#about'
  resources :users do
    resource :relationships,only: [:create,:destroy]
    get "followings" => "relationships#followings",as: "followings"
    get "followers" => "relationships#followers",as: "followers"
  end  
  resources :books do
    resource :favorites,only: [:create,:destroy]
    resources :book_comments,only: [:create,:destroy]
  end
  get "search" => "searches#search"
  resources :groups
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
