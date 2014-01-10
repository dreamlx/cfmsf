Bancheng::Application.routes.draw do
  captcha_route

  resources :home, only: :index
  resources :categories, only: :show
  resources :articles do
    collection do
      get :search
    end
  end
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

  devise_for :users, controllers: {sessions: "sessions"}

  root :to => 'home#index'

end
