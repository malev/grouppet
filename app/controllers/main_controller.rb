class MainController < ApplicationController
  def about
    @about_page = StaticPage.about
  end

  def contact
    @message = Message.new
  end

  def create
    @message = Message.new params[:message]
    if @message.save
      flash[:notice] = "Your message has been sent successfully"
      redirect_to root_path
    else
      flash[:error] = "There was an error"
      render :contact
    end
  end
end
