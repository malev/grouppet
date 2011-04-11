require 'spec_helper'

describe Snippet do

  before(:each) do
    @snippet = Snippet.new :content => "I am testing"
  end

  it 'should belongs to user and language' do
    should belong_to(:user)
    should belong_to(:language)
  end

  it 'should have index' do
    #should have_db_index(:language_id)
    #should have_db_index(:user_id)
  end

  it 'should have a sha always!' do
    @snippet.save
    @snippet.public_sha.should_not be_nil
  end

  it 'should generate correct public sha' do
    Kernel.should_receive(:rand).any_number_of_times.and_return(0.36070346454993063)
    Time.should_receive(:now).any_number_of_times.and_return("2011-04-09 23:37:36 -0300")
    @snippet.private = false
    @snippet.generate_sha.should == "19048f34460c30a376bd8ee77a7d55fe0dfce45a"[0..6]
  end

  it 'should generate correct public sha' do
    Kernel.should_receive(:rand).any_number_of_times.and_return(0.36070346454993063)
    Time.should_receive(:now).any_number_of_times.and_return("2011-04-09 23:37:36 -0300")
    @snippet.private = true
    @snippet.generate_sha.should == "19048f34460c30a376bd8ee77a7d55fe0dfce45a"[0..15]
  end

  it "can be saved successfully" do
    Snippet.create.should be_persisted
  end
end

describe 'Search scopes' do
  it 'should find all public snippet'
  it 'should find a public snippet with a sha'
  it 'should find all private scopes associated to current_user'
end
