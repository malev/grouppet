require 'spec_helper'

describe "Snippets" do
  describe "GET /snippets" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      visit snippets_path
      page.should have_content('share your snippet')
    end
  end

  describe 'POST /snippets' do
    it 'should create a new snippet' do
      @language = Factory(:language)
      visit snippets_path
      fill_in "snippet[content]", :with => 'lorem ipsum'
      click_button 'snippet_submit'
      page.should have_content("lorem ipsum")
    end
  end

  describe 'GET /snippets/public' do
    it 'should list all public snippets' do
      @language = Factory(:language)
      @snippet = Factory(:snippet)
      visit public_snippets_path
      page.should have_content("lorem")
    end
  end

  describe 'GET /snippets/private' do
    it 'should list all private snippets' do
      current_user = Factory(:user)
      @language = Factory(:language)
      @snippet = Factory(:private_snippet)
      visit private_snippets_path
      page.should have_content("private lorem")
    end
  end
end
