class FriendsController < ApplicationController
  autocomplete :user, :email, :full => true

  def index
    
  end  

  def create
    user = User.find_by_email(params[:add_friend][:user_email])
    if user
      user_friend = UserFriend.new(:user => current_user, :friend => user)
      if user_friend.valid? && user_friend.save
        flash[:message] = "Friend added, waiting to be accepted."
        redirect_to :action => :index
      else
        flash[:error] = "There was an error, friend can't be added.'"
        render :action => :index  
      end
    else
      flash[:error] = "Friend not founded."
      render :action => :index
    end
  end

  def accept_friendship
    user_friend = UserFriend.find(params[:id])
    if current_user == user_friend.friend
      user_friend.update_attribute(:accepted, true)
      respond_to do |format|
        format.js { render :json => { :success => true }.to_json }
      end
    else
      respond_to do |format|
        format.json { render :json => { :errors => "Invalid action." }.to_json }
      end
    end
  end
  
  def cancel_friendship
    user_friend = UserFriend.find(params[:id])
    if current_user == user_friend.user
      user_friend.destroy
      respond_to do |format|
        format.js { render :json => { :success => true }.to_json }
      end
    else
      respond_to do |format|
        format.json { render :json => { :errors => "Invalid action." }.to_json }
      end
    end
  end
  
  def remove_friendship
    user_friend = UserFriend.find(params[:id])
    if current_user == user_friend.user || current_user == user_friend.friend
      user_friend.destroy
      respond_to do |format|
        format.js { render :json => { :success => true }.to_json }
      end
    else
      respond_to do |format|
        format.json { render :json => { :errors => "Invalid action." }.to_json }
      end
    end
  end

end
