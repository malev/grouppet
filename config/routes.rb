Grouppet::Application.routes.draw do
  resources :snippets
  resources :groups, :controller => 'user_groups', :as => :groups
  resource :session, :controller => 'sessions'

  match '/sign_out' => "sessions#destroy", :as => 'sign_out'

  root :to => "snippets#index"
end
