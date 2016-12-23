Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :questions do
        get "/first", to: 'questions#first'
        get "/next", to: 'questions#next'
        get "/previous", to: 'questions#previous'
      end
    end
  end
end
