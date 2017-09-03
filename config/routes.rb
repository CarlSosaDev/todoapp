Rails.application.routes.draw do
  devise_for :users,path:'auth', path_names: {sign_in:'login',sign_out:'signout', sign_up:'sign_up'}
  root "pages#home"
  get '/about', to: "pages#about"
  get '/help', to: "pages#help"

  resources :members do
  get 'members'
  end
   match 'users/:id' => 'members#destroy', :via => :delete, :as => :admin_destroy_user
  resources :todos 
  match 'users/:id' => 'todos#todos_user', :via => :get, :as => :todos_by_users
end
