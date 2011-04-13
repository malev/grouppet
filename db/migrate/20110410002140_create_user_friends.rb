class CreateUserFriends < ActiveRecord::Migration
  def self.up
    create_table :user_friends do |t|
      t.integer                          :user_id
      t.integer                          :friend_id
      t.boolean                         :accepted,        :default => false
      t.timestamps
    end

    add_column :snippets, :private, :boolean, :default => false
  end

  def self.down
    remove_column :snippets, :private

    drop_table :user_friends
  end
end
