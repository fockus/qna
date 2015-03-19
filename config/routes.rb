Rails.application.routes.draw do

  devise_for :users
  resources :questions do
    resources :answers, except: [:index]
  end

  root 'questions#index'
end
