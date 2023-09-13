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
    get "/mypage/:id/edit" => "details#edit"
    patch "/mypage/:id/edit" => "details#update"
    get "/mypage/confirm" => "details#confirm"
    patch "/mypage/withdrawal" => "details#withdrawal"
    get "/mypage" => "results#index"
    get "/result/:id/show" => "results#show", as: :result_show
    get "/result/new" => "results#new"
    post "/result/new" => "results#create"
    get "/result/:id/edit/" => "results#edit", as: :result_edit
    patch "/result/:id/edit" => "results#update"
    delete "/result/:id/edit" => "results#destroy"
    resources :results, only: [] do
     resources :comments, only: [:create]
    end
    get "/results/:id/comments/:id" => "comments#destroy", as: "delete_comment"
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
