Rails.application.routes.draw do
  resources :posts
  mount Incognito::Rails::Engine => "/incognito-rails"
end
