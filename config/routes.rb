Rails.application.routes.draw do
  Rails.application.routes.draw do
    mount_ember_app :frontend, to: "/"
  end

  namespace :api do
    namespace :v1 do
      get 'employees/index'
    end
  end

  namespace :api do
    namespace :v1 do
      get 'employees/show'
    end
  end

  get 'home/index'

  namespace :api do
    namespace :v1 do
      resources :employees
    end
  end

  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
