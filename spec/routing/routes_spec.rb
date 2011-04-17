require 'spec_helper'

describe 'snippets routes' do
  it "should have snippets routes" do
    { :get => 'snippets' }.should route_to( :controller => 'snippets', :action => 'index')
    { :get => 'snippets/1' }.should route_to( :controller => 'snippets', :action => 'show', :id => '1')
    { :post => 'snippets' }.should route_to( :controller => 'snippets', :action => 'create')
  end
end

describe 'static pages routes' do
  it 'should have a show routes page' do
    { :get => '/about' }.should route_to( :controller => 'main', :action => 'about' )
  end

  it 'should have a contact rout page' do
    { :get => '/contact' }.should route_to(:controller => 'main', :action => 'contact')
  end

  it 'should have a contact rout page to create' do
    { :post => '/contact' }.should route_to(:controller => 'main', :action => 'create')
  end
end

describe 'blog post routes' do
  it 'blog should go to index page' do
    { :get => 'blog/' }.should route_to( :controller => 'blog/posts', :action => 'index' )
  end

  it 'should have a restufl behaivour' do
    { :get => 'blog/posts' }.should route_to( :controller => 'blog/posts', :action => 'index' )
  end

  it 'should linkt to a post with date' do
    { :get => 'blog/2011/4/3/first-post' }.should route_to( :controller => 'blog/posts', :action => 'show',
                                                             :year => '2011', :month => '4', :day => '3', :id => 'first-post' )
  end
end
