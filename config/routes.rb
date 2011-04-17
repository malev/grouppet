Grouppet::Application.routes.draw do

  match "/about" => 'main#about'
  match '/contact' => 'main#create', :via => :post
  match "/contact" => 'main#contact'

  resources :snippets do
    collection do
      get 'public'
      get 'private'
    end
  end

  match '/blog' => 'blog/posts#index'
  namespace 'blog' do
    resources :posts
  end

  resources :groups, :controller => 'user_groups', :as => :groups
  resource :session
  match '/sign_out' => "sessions#destroy", :as => 'sign_out'

  root :to => "snippets#index"
end
