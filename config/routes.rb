Rails.application.routes.draw do

  resources :users do
    resources :links, :only => [:new, :create, :destroy]
  end
  resources :links, :only => [:index, :show] do
    resources :votes, :only => [:create, :destroy]
    resources :comments, :except => :show
  end

end
