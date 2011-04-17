require 'spec_helper'

describe "Main" do
  describe "GET /blog" do
    it 'should have blogs layout' do
      visit '/blog'
      page.should have_content("Blog")
    end
  end
end
