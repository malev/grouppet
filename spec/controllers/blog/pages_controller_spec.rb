require 'spec_helper'

describe 'GET blog/pages/1' do
  render_views

  describe 'with valid id' do
    before(:each) do
      get "blog/1"
      @page = Factory(:page)
    end

    it 'should accept pettition' do
      flash[:notice].should be_blank
      response.should render_template("show")
    end

#    it 'should find a page and return an object' do
#      Page.should_receive(:this_page).with("1").and_return(@page)
#    end
  end

#  describe 'with invalid id' do
#    before(:each) do
#      Page.should_receive(:this_page).with(1).and_return(nil)
#    end

#    it 'should have a flash error message' do
#      flash[:error].should_not be_blank?
#    end

#    it 'should redirect to blogs index' do
#      response.should redirect_to('/blog')
#    end
#  end
end
