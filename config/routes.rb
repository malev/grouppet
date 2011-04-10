Grouppet::Application.routes.draw do

  namespace "blog" do
    resources :posts
  end

  resource :session
  resources :snippets do
    member do
      get 'public'
      get 'private'
    end
  end

  resources :groups, :controller => 'user_groups', :as => :groups

  match '/:sha' => "snippets#show"
  match '/sign_out' => "sessions#destroy", :as => 'sign_out'

  root :to => "snippets#index"
end
