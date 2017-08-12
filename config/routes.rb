Rails.application.routes.draw do
  root "pages#hom"
  get '/about', to: "pages#about"
  get '/help', to: "pages#help"
  resources :todos
end
