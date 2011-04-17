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

  describe 'POST in contact should persist a message in database' do
    before do
      @message = Factory.build(:message)
      Message.should_receive(:new).with(any_args()).and_return(@message)
    end

    it 'should persist if data is valid' do
#      @message.should_receive(:save).and_return(true)
      post 'contact', :with => {:message => { :name => @message.name, :email => @message.email, :content => @message.content } }
      flash[:notice].should_not nil
    end

    it 'should not persist anything if the data is invalid' do
      post 'contact', :with => {:message => { :name => 'name', :email => 'invalid', :content => 'lorem' } }
      flash[:error].should_not nil
      response.should render_template(:contact)
    end
  end
end
