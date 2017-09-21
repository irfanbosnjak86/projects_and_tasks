Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'projects#index'

  resources :projects do
    resources :tasks do
      put :set_status, on: :member
      get :up, on: :member
      get :down, on: :member
    end
  end
end
