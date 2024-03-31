Rails.application.routes.draw do

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}
  devise_for :users, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

namespace :admin do
    get '/' => 'homes#top'
    resources :reviews
    get '/reviews/search', to: 'reviews#search', as: 'search_reviews'
    resources :dog_runs, except: [:destroy]
    resources :dog_cafes, except: [:destroy]
    resources :dog_hotels, except: [:destroy]
    resources :dog_events, except: [:destroy]
    resources :prefectures, only: [:index]
    resources :users, only: [:update, :index, :show, :edit]
  end

  namespace :public do
    get '/' => 'homes#top'

    resources :dog_runs, only: [:index, :show]
    resources :dog_cafes, only: [:index, :show]
    resources :dog_hotels, only: [:index, :show]
    resources :dog_events, only: [:index, :show]
    resources :prefectures, only: [:index]
    resources :comments, only: [:create]
  end

scope module: :public do
    get "user/my_page/" => 'users#show'
    patch "users/withdrawal" => "users#withdrawal", as: "withdrawal"
    resources :users, only: [:edit, :update]
    get "users/check" => "users#check", as: "user_check"
    resources :post_comments, only: [:create]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
