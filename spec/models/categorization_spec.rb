require 'spec_helper'

describe Categorization do
  it 'should have a belongs to post and category' do
    should belong_to :post
    should belong_to :category
  end
end
