Rails.application.routes.draw do
  root "public/homes#top"
  namespace :public do
    get 'homes/top'
    get 'homes/about'
  end
  devise_for :admins
  devise_for :members
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
