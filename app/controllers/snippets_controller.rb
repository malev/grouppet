class SnippetsController < ApplicationController
  def index
    @snippet = Snippet.new
  end

  def show
    @snippet = Snippet.includes(:language).find(params[:id])
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
