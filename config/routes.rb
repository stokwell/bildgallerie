Rails.application.routes.draw do
 
  devise_for :users
  get 'welcome/index'
  get 'images/show'
  get 'images/new'
  post "images/new" => "images#create"
  get '/signup' =>'users#new'
  resources :galleries do 
    resources :pictures
   end 
  resources :users 
  resources :images
  resources :photos
  resources :users_images
  get '/welcome/signup' =>'users#new'
  get '/photos' => 'photos#index'
  post "/signup" => "users#create"
  get '/login' => 'sessions#new'
  post'/login'=> "sessions#create"
  delete '/photos' => 'photos#destroy'
  delete 'logout' => 'sessions#destroy'
  post '/galleries/:gallery_id/pictures/:id(.:format)' => 'pictures#update'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'galleries#show'

   get 'angular_test', to: "angular_test#index"

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
