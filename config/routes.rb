Rails.application.routes.draw do
 get 'login' => 'session#new'
 post 'login' => 'session#create'
 delete 'logout' => 'session#destroy'

 resources :users, except: [:destroy]
end
