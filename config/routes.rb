Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # devise_for :users

  namespace :api, defaults: {format: :json} do
    scope module: 'user/v1', path: 'user/v1' do
      resources :auth, only: [:index] do
        collection do
          post '/login' => 'auth#login'
          post '/signup' => 'auth#signup'
          post '/test_authen' => 'auth#test_authen'
        end
      end
      resources :blogs, only: [:index, :create, :update, :destroy, :show]
      resources :cards, only: [:create]
      resources :payments, only: [:create]
    end
  end
end
