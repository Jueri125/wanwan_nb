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
    resources :reviews, only: [:new, :create, :index, :show]
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
    get 'users/my_page' => 'users#show'
    patch 'users/update' => 'users#update'
    get 'users/edit' => 'users#edit'
    get "users/check" => "users#check", as: "user_check"
    patch "users/withdrawal" => "users#withdrawal", as: "withdrawal"
    resources :post_comments, only: [:create]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
