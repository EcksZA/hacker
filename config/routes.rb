Rails.application.routes.draw do

  resources :users do
    resources :links, :except => [:edit, :update]
  end
end
