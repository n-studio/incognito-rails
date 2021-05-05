Rails.application.routes.draw do
  resources :posts

  incognito_get :posts, to: "posts#index"
  incognito_get :post, to: "posts#show"
  incognito_get :new_post, to: "posts#new"
  incognito_get :edit_post, to: "posts#edit"
  incognito_post :posts, to: "posts#create"
  incognito_put :post, to: "posts#update"
  incognito_patch :post, to: "posts#update"
  incognito_delete :post, to: "posts#destroy"

  mount Incognito::Engine => "/"
end
