require 'spec_helper'

describe "Pages" do
  describe "GET /pages" do
    it "works! with valid params" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      Page.create!( :id => 1, :name => "lorem", :body => "fff", :status => 'published' )
      get 'blog/1'
      response.body.should include("lorem")
    end

    it 'should redirect to blogs index if no page' do
      Page.should_receive(:this_page).with("1").and_return(nil)
      get 'blog/1'
      response.body.should include("Page not found")
    end
  end
end
