Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "projects/projects#index"

  scope module: :projects, as: :projects do
    resources :projects
  end
end
