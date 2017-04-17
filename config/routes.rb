Rails.application.routes.draw do
  root 'articles#index'
  get 'articles/index' => 'articles#index'
  get 'getdata' => 'articles#getdata'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
