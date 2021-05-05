Incognito::Engine.routes.draw do
  match "#{Incognito.mount_to}/:uuid", to: "incognito#show", via: :all
end
