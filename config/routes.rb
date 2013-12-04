CodingChallengeGrading::Application.routes.draw do
  get "archive/:league", to: 'archive#show'
  #Main page (login, logout, etc.)
  #resources :sessions
  #get "sessions/new"
  
  get 'login', to: 'welcome#login'
  get "logout", to: "welcome#logout"
  post 'login', to: 'welcome#validate_login'
  
  #Admin routes.
  get 'admin' => 'admin#index'
  post 'admin/add_admin'
  put 'admin/add_admin'
  get 'admin/users/:time' => 'admin#users'
  get 'admin/submissions/:time' => 'admin#submissions'
  
  
  #Month submissions.
  
  get "june/bronze"
  get "june/silver"
  get "june/gold"
  get "july/bronze"
  get "july/silver"
  get "july/gold"
  get "august/bronze"
  get "august/silver"
  get "august/gold"
  get "september/bronze"
  get "september/silver"
  get "september/gold"
  get "october/bronze"
  get "october/silver"
  get "october/gold"
  get "november/bronze"
  get "november/silver"
  get "november/gold"
  
  #Results.
  post 'june/bronze' => 'june#result'
  post 'june/silver' => 'june#result'
  post "june/gold" => 'june#result'
  post 'july/bronze' => 'july#result'
  post 'july/silver' => 'july#result'
  post "july/gold" => 'july#result'
  post 'august/bronze' => 'august#result'
  post 'august/silver' => 'august#result'
  post "august/gold" => 'august#result'
  post 'september/bronze' => 'september#result'
  post 'september/silver' => 'september#result'
  post "september/gold" => 'september#result'
  post 'october/bronze' => 'october#result'
  post 'october/silver' => 'october#result'
  post "october/gold" => 'october#result'
  post "november/bronze" => 'fibonacci#index'
  post "november/silver" => 'cheeseburger#index'
  post "november/gold" => 'connect_four#index'
  get "november/gold/demo" => 'connect_four#index', demo: 'true'
  
  #Getting all the submissions.
  get 'all_submissions' => 'november#all_submissions'
  
  #Comments
  resources :comments
  get 'comments/time/created/:id' => 'comments#created_time', as: :comment_created_time
  get 'comments/time/updated/:id' => 'comments#updated_time', as: :comment_updated_time
  get 'comments/:month/:league' => 'comments#show'
  
  #User profile
  get "profile/view"
  delete "profile/submissions/:id" => "profile#destroy" , as: :submission
  patch "users/:id", to: "user#update", as: :user
  
  #API For Manager Portal
  get "user/:last/:first"=> "user#submissions_history"
  
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
