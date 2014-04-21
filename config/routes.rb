CodingChallengeGrading::Application.routes.draw do
  get "archive/:league", to: 'archive#show', as: :archive

  get 'login', to: 'welcome#login'
  get "logout", to: "welcome#logout"
  post 'login', to: 'welcome#validate_login'
  get 'rules', to: 'welcome#rules'
  
  #Survey Routes
  #get 'survey' => 'survey#index', as: :surveys
  #post'survey' => 'survey#create'
  get 'survey/result' => 'survey#result'
  get 'survey/maze/:size' => 'survey#maze'
  #Admin routes.
  get 'admin' => 'admin#index'
  patch 'admin/set' => 'admin#set_current_month_year'
  get 'admin/users/:time' => 'admin#users', as: :admin_users
  get 'admin/submissions/:time' => 'admin#submissions', as: :admin_submissions
  
  #Month submissions.
  get "challenge/:month/:year/:league", to: "challenge#index", as: :challenge
  get "submissions/:month/:year/:league", to: "challenge#all_submissions", as: :submissions
  patch "profile/submissions/:id" => "submission#update"
  get 'submission/:id' => 'submission#show', as: :user_submission
  post 'challenge_winners/winner' => 'submission#winner'
  
  #Results.
  post 'challenge/:month/:year/:league' => 'challenge#result'
  get "challenge/november/2013/gold/demo" => 'challenge#result', demo: 'true'
  
  #Maze Challenge
  get "maze/index/:id" => 'maze#index'
  
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
