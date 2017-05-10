Rails.application.routes.draw do
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


  get 'item/:item_hash', to: 'items#show'
  get 'item/:item_hash/entries', to: 'entries#index'
  get 'items', to: 'items#index'

  get 'entries', to: 'entries#index'
  get 'entry/:entry_number', to: 'entries#show'
  get 'entry/:entry_number/proofs', to: 'proofs#entries'

  get 'records', to: 'records#index'
  get 'record/:item_id', to: 'records#show'
  get 'record/:item_id/entries', to: 'entries#index'
  get 'records/:field_name/:value', to: 'records#index'

  get 'proofs', to: 'proofs#index'
  get 'proof/register/:proof_identifier', to: 'proofs#register'
  get 'proof/entry/:entry_number/:total_entries/:proof_identifier', to: 'proofs#entry'
  get 'proof/consistency/:total_entries_1/:total_entries_2/:proof_identifier',
      to: 'proofs#consistency'
  get 'proof/records/:proof_identifier', to: 'proofs#records'
  get 'proof/record/:total_entries/:item_primary_key/:proof_identifier', to: 'proofs#record'

  get 'register', to: 'register#show'
  get 'download-register', to: 'register#download'
end
