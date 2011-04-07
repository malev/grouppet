class UserUserGroup < ActiveRecord::Base
  belongs_to :user, :foreign_key => 'member_id'
  belongs_to :user_group
end
