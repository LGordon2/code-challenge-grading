CodingChallengeGrading::Application.routes.draw do
  #Temp location for connect four
  get "november/gold/connect4" => "connect_four#index"
  
  #Main page (login, logout, etc.)
  resources :sessions
  get "sessions/new"
  get 'login' => 'welcome#login'
  get "logout" => "sessions#destroy"
  
  #Admin routes.
  get 'admin' => 'admin#index'
  
  #Month submissions.
  get "october/bronze"
  get "october/silver"
  get "october/gold"
  get "november/bronze"
  get "november/silver"
  get "november/gold"
  
  #Results.
  post 'october/bronze' => 'october#result'
  post 'october/silver' => 'october#result'
  post "october/gold" => 'october#result'
  post "november/bronze" => 'november#result'
  post "november/silver" => 'november#result'
  post "november/gold" => 'november#result'
  
  #Comments
  resources :comments
  get 'comments/time/created/:id' => 'comments#created_time', as: :comment_created_time
  get 'comments/time/updated/:id' => 'comments#updated_time', as: :comment_updated_time
  get 'comments/:month/:league' => 'comments#show'
  
  #User profile
  get "profile/view"
  delete "profile/submissions/:id" => "profile#destroy" , as: :submission
  
  #Getting all the submissions.
  get 'all_submissions' => 'october#submission_json'
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

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
