class MainController < ApplicationController
  def about
    @about_page = StaticPage.about
  end
end
