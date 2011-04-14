Grouppet::Application.routes.draw do

  match "/blog" => "blog/posts#index"
  match "/blog/:id" => "blog/pages#show"
  namespace "blog" do
    resources :posts
    resources :pages
  end

  resources :snippets do
    collection do
      get 'public'
      get 'private'
    end
  end

  resources :friends do
    collection do
      get :autocomplete_user_email
      get :accept_friendship
      get :cancel_friendship
      get :remove_friendship
    end
  end

  resources :groups, :controller => 'user_groups', :as => :groups
  resource :session
  match '/sign_out' => "sessions#destroy", :as => 'sign_out'

  root :to => "snippets#index"
end
