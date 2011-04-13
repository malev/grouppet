class User < ActiveRecord::Base
  include Clearance::User

  # FRIENDS CONFIGURATION
  # Invited friends are the friends that the user invited.
  has_many :user_invited_friends, :class_name => 'UserFriend', :dependent => :nullify
  has_many :invited_friends, :through => :user_invited_friends, :source => :user
  # Asked friendships are the ones that ask the user to be their friend.
  has_many :user_asked_friendships, :class_name => 'UserFriend', :foreign_key => 'friend_id', :dependent => :nullify
  has_many :asked_friendships, :through => :user_asked_friendships, :source => :friend

  # A merge of invited friends and asked friendship users.
  def my_friends
    (invited_friends + asked_friendships).compact.uniq
  end  
end
