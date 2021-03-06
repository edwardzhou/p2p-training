P2pTraining::Application.routes.draw do
  ActiveAdmin.routes(self)

  get "catalogs/index"

  get "catalog/view"

  devise_for :users, :controllers => {:registrations => 'registrations', :confirmations => 'confirmations'}

  get "home/index"

  match 'catalog/:id' => "catalog#view", :as => :catalog
  #match 'invitations/:id' => "invites#invite"

  resource :profile do
    get :my_invitations
  end

  resources :invitations

  resources :courses, :only => [:index, :show] do
    collection do
      get :latest, :hot
    end
    member do
      get :finished_campaigns
    end

    resources :comments
  end

  resources :campaigns do
    resources :orders do
      collection do
        post :verify_coupon
        get :verify_coupon
      end

    end
  end

  resources :orders do

    member do
      get :confirm_payment
      post :pay
      post :cancel
      post :apply_to_refund
    end
  end

  resources :favorites

  resources :errors, :only => [:show]

  match 'services' => "company#services"
  match 'about_us' => "company#about_us"
  match 'join_us' => "company#join_us"
  match 'help' => "company#help"
  match 'trainers' => "company#trainers"

  #resources :alipay_tests do
  #  collection do
  #    post :notify
  #    get :notify
  #    post :done
  #    get :done
  #  end
  #end

  match '/payments/notify' => "payments#notify", :via => [:get, :post]
  match '/payments/done' => "payments#done", :via => [:get, :post]

  #resources :payments, :only => [:notify, :done] do
  #  collection do
  #    post :notify
  #    get :notify
  #    post :done
  #    get :done
  #  end
  #end


  resource :assets do
    member do
      post :upload_image
      get :browse_images
      #post :browse_images
    end
  end

  namespace :admin do
    resources :catalogs do
      member do
        post :enable
        post :disable
      end
    end

    resources :courses do
      resources :campaigns do
        collection do
          get :search
          post :search
        end
        member do
          post :absent, :present, :finish
          get :absent, :present
        end

        #resources :feedbacks
      end
    end

    resources :users do
      collection do
        get :search
      end
    end

    resources :locations

    resources :orders

    resources :payments

    resource :dashboards

    resources :custom_emails

    resources :coupons


    root :to => "dashboards#show"
  end

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
  # just remember to delete public/index.html.backup.
  # root :to => "welcome#index"
  root :to => "home#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
