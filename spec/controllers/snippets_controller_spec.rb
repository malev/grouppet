require 'spec_helper'

describe SnippetsController, "Creating and showing a snippet" do
  render_views

  it 'should render a new template' do
    @snippet = Factory(:snippet)
    get 'index'
    response.should render_template('index')
  end

  it 'should create a new snippet' do
    @language = Factory(:language)
    @snippet = Factory(:snippet)
    post 'create', :snippet => { :content => "hola que tal", :language_id => 1 }
    flash[:notice].should_not be_blank
    response.should render_template('show')
  end

  it 'should show a super snippet' do
    @language = Factory(:language)
    @snippet = Factory(:snippet)
    Snippet.should_receive(:where).with(any_args()).and_return([@snippet])
    get 'show', :id => '999999'
    response.should render_template('show')
  end

  it 'should redirect to index if sha not exist' do
    Snippet.should_receive(:where).with(any_args()).and_return([nil])
    get 'show', :id => 'noexiste'
    flash[:error].should_not be_nil
    response.should redirect_to(root_path)
  end
end
