require 'spec_helper'

describe Post do
  before do
    @newer = Factory(:newer)
    @older = Factory(:older)
    @draft = Factory(:draft)
  end

  it 'should search from newer to older the posts' do
    @blog = Post.blogger
    @blog.length.should == 2
    @blog.first.name == @newer.name
    @blog.last.name == @older.name
  end

  it 'should only deliver published posts' do
    Post.blogger.all.each do |p|
      p.status.should_not == "draft"
    end
  end

  it 'should validate prescence and uniqueness of name' do
    Post.create! :name => 'testing'
    should validate_uniqueness_of(:name)
    should validate_presence_of(:name)
  end

  it 'should have a user owner' do
    should belong_to(:user)
  end

  it 'should has many categories' do
    should have_many(:categories).through(:categorizations)
  end

  it 'should have a revission system - maybe later'

end
