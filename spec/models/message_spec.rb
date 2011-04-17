require 'spec_helper'

describe Message do
  it 'should validate email, name' do
    should validate_presence_of(:name)
    should validate_presence_of(:email)
    should_not allow_value("blah").for(:email)
    should allow_value("a@b.com").for(:email)
  end
end
