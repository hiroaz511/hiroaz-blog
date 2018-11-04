Rails.application.routes.draw do

  post  'likes/:article_id/create' => 'likes#create'
  post 'likes/:article_id/destroy' => 'likes#destroy'

  post 'login' => 'users#login'
  get 'login' => 'users#login_form'
  post 'logout' => 'users#logout'
  get 'logout' => 'users#logout'

  get 'users/index' => 'users#index'
  get 'signup' => 'users#new'
  post 'users/create' => 'users#create'
  get 'users/:id' => 'users#show'
  post 'users/:id/update' => 'users#update'
  get 'users/:id/edit' => 'users#edit'



  get 'welcome/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :articles do
  resources :comments
end
  root 'welcome#index'

end


