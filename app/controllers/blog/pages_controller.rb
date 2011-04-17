class Blog::PagesController < BlogsController
  def show
    @page = Page.this_page params[:id]
  end
end
