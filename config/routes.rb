Grouppet::Application.routes.draw do
  resources :snippets
  resource :session, :controller => 'sessions'

  match '/sign_out' => "sessions#destroy", :as => 'sign_out'

  root :to => "snippets#index"
end
