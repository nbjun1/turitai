Rails.application.routes.draw do

  root "public/homes#top"
  get "/about" => "public/homes#about", as: :about
  get "/genre/index" => "public/genres#index"
  get "/genre/:id/show" => "public/genres#show", as: :genre_show

  devise_for :admin, :controllers => {
  :sessions => 'admin/sessions',
  :passwords => 'admin/passworde',
  }
  devise_for :member, :controllers => {
  :sessions => 'member/sessions',
  :passwords => 'member/passwords',
  :registrations => 'member/registrations',
  }

  namespace :admin do
    get "/top" => "homes#top", as: :top
    resources :genres, only: [:index, :edit, :create, :update, :destroy]
    resources :members, only: [:show, :edit, :update]
  end

  namespace :member do
    get "/mypage/:id/edit" => "details#edit"
    patch "/mypage/:id/edit" => "details#update"
    get "/mypage/:id/confirm" => "details#confirm", as: :mypage_confirm
    patch "/mypage/:id/withdrawal" => "details#withdrawal", as: :mypage_withdrawal
    get "/mypage/:id" => "results#index", as: :mypage
    get "/result/:id/show" => "results#show", as: :result_show
    get "/result/new" => "results#new"
    post "/result/new" => "results#create"
    get "/result/:id/edit" => "results#edit", as: :result_edit
    patch "/result/:id/edit" => "results#update"
    delete "/result/:id" => "results#destroy", as: :result_delete
    resources :results, only: [] do
      resource :favorites, only: [:create, :destroy]
      resources :comments, only: [:create, :destroy]
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
