Rails.application.routes.draw do
  resources :courses do
    resources :course_modules
  end
  root "courses#index"
end