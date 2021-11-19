Rails.application.routes.draw do

  get 'homepage/home'

  get 'homepage_controller/home'

  # generate routs for devise login
  #devise_for :administrators
  #devise_for :nurses
  #devise_for :parents

  devise_for :administrators, path: 'administrators', controllers: {
    sessions: "administrators/sessions"
  }
  devise_for :nurses, path: 'nurses', controllers: {
    sessions: "nurses/sessions"
  }
  devise_for :parents, path: 'parents', controllers: {
    sessions: "parents/sessions"
  }

  # administrator controller routes
  get 'administrator/homepage', as: :administrator_root

  # nurse controller routes
  get 'nurse/homepage', as: :nurse_root

  # parent controller routes
  get 'parent/homepage', as: :parent_root

  # homepage routes
  get 'homepage/home'

  # define application root route
  root to: 'homepage#home'

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
