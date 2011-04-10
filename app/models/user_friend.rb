class UserFriend < ActiveRecord::Base
  validate :friendship_uniqueness
  validate :i_cannot_be_my_friend 

  belongs_to :user, :class_name => 'User'
  belongs_to :friend, :class_name => 'User', :foreign_key => 'friend_id'

  scope :invited, lambda { |user_id, friend_id|
    where("user_id = ? AND friend_id = ?", user_id, friend_id)
 }
  scope :invitations, lambda { |user_id, friend_id|
    where("user_id = ? AND friend_id = ?", friend_id, user_id)
  }

  def friendship_uniqueness
    unless UserFriend.invited(user_id, friend_id).empty? && UserFriend.invitations(user_id, friend_id).empty?
      errors.add_to_base("You already have that friend.")
    end
  end

  def i_cannot_be_my_friend
    if user_id == friend_id
      errors.add_to_base("You can't be your own friend.'")
    end
  end

end
