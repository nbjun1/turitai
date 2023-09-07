Rails.application.routes.draw do

  root "public/homes#top"
  get "/about" => "public/homes#about", as: :about
  
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
  end
  
  namespace :member do
    resources :details, only: [:show, :edit, :update, :confirm, :withdrawal]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
