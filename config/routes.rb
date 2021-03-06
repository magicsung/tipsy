Rails.application.routes.draw do

  root "tipsy#index"

  post 'allpay/result'
  post 'allpay/return'

  require 'sidekiq/web'
  authenticate :user, lambda { |u| u.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  get 'profile/:id' => "tipsy#profile", as: 'profile'

  resources :tipsy, only: [:index]
  resources :stores, only: %i[index show]
  resources :djs, only: %i[index show]
  resources :events, only: %i[index show]
  resources :categories, only: [:index]
  resources :comments, only: %i[create destroy]
  resources :playlists
  resources :contacts, only: [:create]
  resources :vips, only: [:index]
  resources :meetups, only: [:index]
  resources :orders, only: %i[new create show] do
    get :checkout, on: :member
  end


  scope :path => '/api/v1/', :defaults => { :format => :json }, :module => "api_v1", :as => 'v1' do
    resources :categories, only: [:index]
    resources :stores, only: %i[index show]
    resources :events, only: %i[index show]
    resources :djs, only: %i[index show]
    resources :comments, only: %i[index create destroy]
    post "/login" => "auth#login"
    post "/logout" => "auth#logout"
    post "/confirm" => "vips#confirm"
    get "/getvip" => "vips#getvip"
  end

  namespace :admin do
    root "events#index"
    resources :user
    resources :store
    resources :djs
    resources :events
    resources :categories
    resources :comments
    resources :playlists
    resources :vips
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
