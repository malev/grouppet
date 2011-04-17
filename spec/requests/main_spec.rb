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

describe 'Contact' do
  it 'should respond ok' do
    get '/contact'
    response.status.should be(200)
  end

  it 'should display the form' do
    visit '/contact'
    page.should have_selector('div form')
  end

  it 'should let submit the form contact' do
    visit '/contact'
    fill_in('Name', :with => 'John')
    fill_in('Email', :with => 'marcos.vanetta@gmail.com')
    fill_in('message_content', :with => 'text')
    click_button("message_submit")
    page.should have_content("successfully")
  end

  it 'should not let submit if form is empty' do
    visit '/contact'
    click_button("message_submit")
    page.should have_content("can't be blank")
  end
end
