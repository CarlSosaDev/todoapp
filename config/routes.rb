Rails.application.routes.draw do
  devise_for :users,path:'auth', path_names: {sign_in:'login',sign_out:'signout', sign_up:'sign_up'}
  root "pages#home"
  get '/about', to: "pages#about"
  get '/help', to: "pages#help"
  resources :todos
end
