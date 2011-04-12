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
  it "should have snippets routes" do
    { :get => 'snippets' }.should route_to( :controller => 'snippets', :action => 'index')
    { :get => 'snippets/1' }.should route_to( :controller => 'snippets', :action => 'show', :id => '1')
    { :post => 'snippets' }.should route_to( :controller => 'snippets', :action => 'create')
  end
end
