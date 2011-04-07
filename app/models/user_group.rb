class UserGroup < ActiveRecord::Base
  
  # Members of the group
  has_many :user_user_groups
  has_many :members, :source => :user, :through => :user_user_groups

  belongs_to :user

  validates_presence_of :name
end
