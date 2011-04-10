class User < ActiveRecord::Base
  include Clearance::User

  # Groups that the user has
  #has_many :groups, :class_name => 'UserGroup', :dependent => :destroy
  # Groups where the user is
  #has_many :user_user_groups, :foreign_key => 'member_id'
  #has_many :member_groups, :source => :user_group, :through => :user_user_groups
end
