Rails.application.routes.draw do
  get '/todos' => 'todos#index'
  get '/todos/:id' => 'todos#get_todo'
  post '/todos' => 'todos#create'
  patch '/todos/:id' => 'todos#update'
  delete '/todos/:id' => 'todos#destroy'
  delete '/todos' => 'todos#delete_all'
  root 'todos#index'

  resources :todos
end
