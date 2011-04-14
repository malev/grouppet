require 'spec_helper'

describe "Main" do
  describe "GET /about" do
    it 'should show me the title' do
      visit '/about'
      page.should have_content("About us")
    end

    it 'should show the content of the database if it is there' do
      @static_page = Factory(:static_page)
      StaticPage.should_receive(:about).and_return(@static_page)
      visit '/about'
      page.should have_content(@static_page.body)
    end

    it 'should a in construction message if we can not find the data' do
      StaticPage.should_receive(:about).and_return(nil)
      visit '/about'
      page.should have_content("construction")
    end
  end
end
