class MainController < ApplicationController
  def index
    @snippet = Snippet.new
  end
end
