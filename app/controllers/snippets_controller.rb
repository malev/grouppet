class SnippetsController < ApplicationController
  def index
    @snippet = Snippet.new
  end

  def show
    @snippet = Snippet.where("public_sha = ? and private = ?", params[:id], 0).first
    if @snippet
      render :show
    else
      flash[:error] = "Snippet not found."
      redirect_to root_path
    end
  end

  def create
    @snippet = Snippet.new params[:snippet]
    @snippet.user_id = current_user.id if current_user
    if @snippet.save
      flash[:notice] = "You snippet has been created successfully."
      render :show
    else
      flash[:error] = "There was an error, please try again"
      render :new
    end
  end
end
