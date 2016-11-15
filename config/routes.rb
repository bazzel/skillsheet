Rails.application.routes.draw do
  Rails.application.routes.draw do
    mount_ember_app :frontend, to: "/"
  end

  namespace :api do
    namespace :v1 do
      resources :employees
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
