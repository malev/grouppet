class Blog::PostsController < BlogsController
  def index
    @posts = Post.blogger.page(params[:page])
  end
end
