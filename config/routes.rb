Rails.application.routes.draw do
  # set top as root
  root :to => 'homes#top'

  # resource routing
  resources :books
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
