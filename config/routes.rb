Grouppet::Application.routes.draw do

  match "/blog" => "blog/posts#index"
  match "/blog/:id" => "blog/pages#show"
  namespace "blog" do
    resources :posts
    resources :pages
  end

  resources :snippets do
    member do
      get 'public'
      get 'private'
    end
  end

  resources :groups, :controller => 'user_groups', :as => :groups
  resource :session
  match '/sign_out' => "sessions#destroy", :as => 'sign_out'

  root :to => "snippets#index"
end
