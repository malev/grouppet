require 'spec_helper'

describe "blogs routes" do
  it "routes /blog to blog/posts#index" do
    { :get => "/blog" }.should route_to(
      :controller => "blog/posts",
      :action => "index"
    )
  end

  it 'route /blog/1 to blog/pages#show' do
    { :get => 'blog/1' }.should route_to(
      :controller => 'blog/pages',
      :action => 'show',
      :id => "1"
    )
  end

  it 'route /blog/pages/1 to blog/pages#show' do
    { :get => 'blog/pages/1' }.should route_to(
      :controller => 'blog/pages',
      :action => 'show',
      :id => '1'
    )

  end
end

describe 'snippets routes' do
  it "route '/' should show new snippet view" do
    { :get => '/' }.should route_to(
      :controller => 'snippets',
      :action => 'index'
    )
  end

  it "route '/:sha' should route to show snippet" do
    { :get => '/999999'}.should route_to(
      :controller => 'snippets',
      :action => 'show',
      :sha => '999999'
    )
  end
end
