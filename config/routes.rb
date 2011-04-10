Grouppet::Application.routes.draw do

  resource :session
  resources :snippets, :member => { :public => :get, :private => :get}

  match '/:sha' => "snippets#show"
  match '/sign_out' => "sessions#destroy", :as => 'sign_out'

  root :to => "snippets#index"
end
