Rails.application.routes.draw do
  get 'home/index'

  devise_for :users
  root to: "home#index"
  resources :secret_codes,  only: [:index] do
  	collection do
      post :genrate_secret_code
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
