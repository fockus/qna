Rails.application.routes.draw do

  resources :questions do
    #resources :answers, except: [:index]
  end

  root 'questions#index'
end
