require 'spec_helper'

describe Post do
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
