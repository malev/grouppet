class Blog::PagesController < Blog::BlogsController
  def show
    @page = Page.this_page params[:id]
  end
end
