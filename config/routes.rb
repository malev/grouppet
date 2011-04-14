Grouppet::Application.routes.draw do

  match "/about" => 'main#about'

  resources :snippets do
    collection do
      get 'public'
      get 'private'
    end
  end

  resources :groups, :controller => 'user_groups', :as => :groups
  resource :session
  match '/sign_out' => "sessions#destroy", :as => 'sign_out'

  root :to => "snippets#index"
end
