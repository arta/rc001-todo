Rails.application.routes.draw do
  resources :projects
  resources :tasks do
    collection do
      get 'incomplete'
      get 'last_incomplete'
    end
  end

  resources :users
end
