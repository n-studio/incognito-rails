Rails.application.routes.draw do
  resources :posts

  obfuscate_get :posts, to: "posts#index"
  obfuscate_get :post, to: "posts#show"
  obfuscate_get :new_post, to: "posts#new"
  obfuscate_get :edit_post, to: "posts#edit"
  obfuscate_post :posts, to: "posts#create"
  obfuscate_put :post, to: "posts#update"
  obfuscate_patch :post, to: "posts#update"
  obfuscate_delete :post, to: "posts#destroy"

  mount Incognito::Engine => "/"
end
