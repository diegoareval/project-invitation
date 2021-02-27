Rails.application.routes.draw do
  devise_for :users
  resources :projects do
    resources :project_users, path: :users, module: :projects
  end
  root to: "projects#index"
end