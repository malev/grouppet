require 'spec_helper'

describe MainController do

  describe "GET 'about'" do
    it "should be successful" do
      @static_page = Factory(:static_page)
      StaticPage.should_receive(:about).and_return(@static_page)
      get 'about'
      @static_page.should_not be_an_instance_of(Array)
      @static_page.title.should == 'about'
    end
  end

end
