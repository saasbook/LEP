LEP::Application.routes.draw do

  get 'welcome/index'
  get 'users/invalid', to: 'users#invalid'

  get "groups/manage" => "groups#manage", :as => :manage_groups
  resources :groups
  resources :users do
    resources :timesheets
  end
  resources :admins
  resources :pairs

  root :to => "welcome#index"
  get "/auth/:provider/callback" => "users#home"

  put "admins/:id/deactivate/:user_id" => "admins#deactivate", :as => :admin_deactivate_user
  put "admins/:id/activate/:user_id" => "admins#activate", :as => :admin_activate_user
  
  put "admins/:id/make_admin/:user_id" => "admins#make_admin", :as => :admin_make_admin
  put "admins/:id/revoke_admin/:user_id" => "admins#revoke_admin", :as => :admin_revoke_admin

  put "admins/:id/make_facilitator/:user_id" => "admins#make_facilitator", :as => :admin_make_facilitator
  put "admins/:id/revoke_facilitator/:user_id" => "admins#revoke_facilitator", :as => :admin_revoke_facilitator

  put 'admins/:id/edit_group/:group_id' => 'admins#edit_group', :as => :admin_edit_group

  post "/user/:id/deactivate" => 'users#deactivate'
  post "/user/:id/activate" => 'users#activate'
  get "admins/:id/pairing" => "admins#pairing", :as => :pairing

  get "groups/:id/join" => "groups#join", :as => :join_groups
  get "groups/:id/leave" => "groups#leave", :as => :leave_groups

  get "admins/:id/show_pair/:pair_id" => "admins#show_pair", :as => :admin_show_pair
  get "admins/:id/view_users" => "admins#view_users", :as => :admin_view_users
  get "admins/:id/remove_from_pair/:pair_id" => "admins#remove_from_pair", :as => :admin_remove_from_pair
  get "admins/:id/add_to_pair/:pair_id" => "admins#add_to_pair", :as => :admin_add_to_pair
  get "admins/:id/show_user/:user_id" => "admins#show_user", :as => :admin_show_user
  post "admins/:id/delete_user/:user_id" => 'admins#delete_user', :as => :admin_delete_user
  post "admins/:id/create_pair" => 'admins#create_pair', :as => :admin_create_pair

  post "admins/:id/set_deadline" => 'admins#set_application_deadline', :as => :admin_set_deadline

  get "admins/:id/analytics" => "admins#analytics", :as => :admin_analytics

  get "admins/:id/download_users" => "admins#download_users", :as => :admin_dl_users
  get "admins/:id/download_pairs" => "admins#download_pairs", :as => :admin_dl_pairs


  get "admins/:id/pairs" => "admins#pairs", :as => :admin_pairs
  get "admins/:id/users" => "admins#users", :as => :admin_users

  #put "pairs/:id/add" => "pairs#add", :as => :pair_add
  #put "pairs/:id/remove" => "pairs#remove", :as => :pair_remove

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'

end
