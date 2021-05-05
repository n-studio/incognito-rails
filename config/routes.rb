Incognito::Engine.routes.draw do
  match ":uuid", to: "incognito#show", via: :all
end
