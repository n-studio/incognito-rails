Rails.application.routes.draw do
  mount Incognito::Rails::Engine => "/incognito-rails"
end
