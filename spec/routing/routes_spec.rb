require 'spec_helper'

describe 'snippets routes' do
  it "should have snippets routes" do
    { :get => 'snippets' }.should route_to( :controller => 'snippets', :action => 'index')
    { :get => 'snippets/1' }.should route_to( :controller => 'snippets', :action => 'show', :id => '1')
    { :post => 'snippets' }.should route_to( :controller => 'snippets', :action => 'create')
  end
end

describe 'pages routes' do
  it 'should have a show routes page' do
    { :get => '/about' }.should route_to( :controller => 'main', :action => 'about' )
  end
end
