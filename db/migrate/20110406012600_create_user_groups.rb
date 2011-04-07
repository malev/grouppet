class CreateUserGroups < ActiveRecord::Migration
  def self.up
    create_table :user_groups do |t|
      t.integer           :user_id,       :null => false
      t.string             :name
      t.text                :description
      t.timestamps
    end
    
    create_table :user_user_groups do |t|
      t.integer           :member_id
      t.integer           :user_group_id
    end

    add_column :snippets, :private, :boolean
  end

  def self.down
    drop_table :user_groups
    drop_table :user_user_groups

    remove_column :snippets, :private
  end
end
