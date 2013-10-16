CodingChallengeGrading::Application.routes.draw do
  resources :sessions
  resources :comments
  get "sessions/new"
  get 'new_user' => 'users#new'
  get 'profile' => 'users#profile'
  post 'new_user' => 'users#create'
  get 'create_success' => 'users#show'
  get 'login' => 'welcome#login'
  get "logout" => "sessions#destroy"
  get "october/bronze"
  get "october/silver"
  get "october/gold"
  get 'admin' => 'admin#index'
  get 'admin/:id' => 'admin#show'
  patch 'admin/:id' => 'admin#update'
  delete '/admin/:id' => 'users#destroy', as: :user
  post 'october/bronze' => 'october#result'
  post 'october/silver' => 'october#result'
  post "october/gold" => 'october#result'
  get 'all_submissions' => 'october#submission_json'
  get "welcome/index"
  delete "comments/:id" => "comments#destroy"
  delete "submissions/:id" => "profile#destroy" , as: :submission
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'welcome#root'

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
