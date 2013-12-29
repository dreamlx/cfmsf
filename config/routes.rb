Bancheng::Application.routes.draw do
  captcha_route

  devise_for :users

  resources :home, only: :index

  namespace :admin do
    resources :users
    resources :home, only: :index
    resources :categories, except: :show
    resources :articles, except: :show do
      member do
        put :reject
        put :approve
      end
    end
  end

  root :to => 'home#index'

end
