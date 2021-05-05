Rails.application.routes.draw do
  resources :posts

  obfuscate :get, :posts, :post, :new_post, :edit_post
  obfuscate :post, :posts
  obfuscate :put, :post
  obfuscate :patch, :post
  obfuscate :delete, :post

  mount Incognito::Engine => "/"
end
