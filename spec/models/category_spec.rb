require 'spec_helper'

describe Category do
  it 'should validate prescense and uniqueness of name' do
    Category.create! :name => 'testing'
    should validate_uniqueness_of(:name)
    should validate_presence_of(:name)

  end

  it 'should has many posts' do
    should have_many(:posts).through(:categorizations)
  end
end
