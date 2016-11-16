Rails.application.routes.draw do
  Rails.application.routes.draw do
    mount_ember_app :frontend, to: "/"
  end

  namespace :api do
    namespace :v1 do
      resources :employees, shallow: true do
        resources :skills
      end
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
