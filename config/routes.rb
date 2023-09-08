Rails.application.routes.draw do

  root "public/homes#top"
  get "/about" => "public/homes#about", as: :about
  get "/genre/index" => "public/genres#index"
  get "/genre/show" => "public/genres#show"

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
    get "/mypage" => "details#show"
    get "/mypage/edit" => "details#edit"
    patch "/mypage" => "details#update"
    get "/mypage/confirm" => "details#confirm"
    patch "/mypage/withdrawal" => "details#withdrawal"
    get "/result/index" => "results#index"
    get "/result/show" => "results#show"
    get "/result/new" => "results#new"
    post "/result/new" => "results#create"
    get "/result/edit" => "results#edit"
    patch "result/edit" => "results#edit"
    delete "result/edit" => "results#edit"
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
