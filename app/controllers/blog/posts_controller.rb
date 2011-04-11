class Blog::PostsController < ApplicationController
  def index
    @posts = Post.show_public_posts
  end
end
