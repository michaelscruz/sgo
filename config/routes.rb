Rails.application.routes.draw do

  resources :charges, only: [:new, :create]

  # sign in/sign up routes
  devise_for :users, :controllers => { 
    registrations: 'users/registrations' 
  }

  # household actions
  get 'household', :to => "households#root", :as => :household_root
  resources :households do
    resources :children, :only => [:index, :new, :create, :edit, :update]
    member do
      get 'applications', :to => "households#applications", :as => :applications
      get 'applications/new', :to => "households#new_application", :as => :new_application
      post 'applications', :to => "households#create_application", :as => :create_application
    end
  end

  # school actions
  resources :schools, :only => [:show] do
    member do
      get 'landing', :to => "schools#landing"
    end
  end

  # resources :applications
  resources :donations
  
  root 'donations#index'
  get 'static', :to => "static_pages#static_elements"
  get 'schools/1/landing', :to => "static_pages#landing_page"
  get 'dor/donations', :to => "static_pages#dor_donations_home"
  get 'dor/donations/1', :to => "static_pages#dor_donation"
  get 'school/applications', :to => "static_pages#school_applications_home"
  get 'school/applications/new', :to => "static_pages#school_applications_new"
  get 'school/donations', :to => "static_pages#school_donations_home"
  get 'school/disbursements', :to => "static_pages#school_disbursements_home"
  get 'school/donors/1', :to => "static_pages#school_donor_profile"

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
