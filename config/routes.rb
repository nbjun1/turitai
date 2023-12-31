Rails.application.routes.draw do

  root "public/homes#top"
  get "/about" => "public/homes#about", as: :about
  get "/genre/index" => "public/genres#index"
  get "/genre/:id/show" => "public/genres#show", as: :genre_show
  get "/search" => "public/searches#search"
  get "/keysearch" => "public/searches#keysearch"
  get "/post" => "public/posts#new", as: :image
  post "/post" => "public/posts#create"
  get "/post/:id/show" => "public/posts#show", as: :image_show

  devise_for :admin, :controllers => {
  :sessions => "admin/sessions",
  :passwords => "admin/passwords",
  :registrations => "admin/registrations"
  }
  devise_for :member, :controllers => {
  :sessions => 'member/sessions',
  :passwords => 'member/passwords',
  :registrations => 'member/registrations'
  }

  namespace :admin do
    get "/top" => "homes#top", as: :top
    resources :genres, only: [:index, :edit, :create, :update, :destroy]
    resources :members, only: [:show, :edit, :update]
  end

  namespace :member do
    # マイページに関するルーティング
    get "/mypage/:id/edit" => "details#edit", as: :mypage_edit
    patch "/mypage/:id/edit" => "details#update"
    get "/mypage/:id/confirm" => "details#confirm", as: :mypage_confirm
    patch "/mypage/:id/withdrawal" => "details#withdrawal", as: :mypage_withdrawal
    get "/mypage/:id" => "results#index", as: :mypage

    # 釣果情報に関するルーティング
    get "/result/:id/show" => "results#show", as: :result_show
    get "/result/new" => "results#new"
    post "/result/new" => "results#create"
    get "/result/:id/edit" => "results#edit", as: :result_edit
    patch "/result/:id/edit" => "results#update"
    delete "/result/:id" => "results#destroy", as: :result_delete

    # 釣果情報のコメントとお気に入りに関するルーティング APIを使用した都道府県と市区町村名のためのルーティングを追加
    resources :results, only: [] do
      collection do
        get "cities"
      end
      resource :favorites, only: [:create, :destroy]
      resources :comments, only: [:create, :destroy]
    end

  end

  devise_scope :member do
    post "member/guest_sign_in", to: "member/sessions#guest_sign_in"
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
