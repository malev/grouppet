class CreatePagesTable < ActiveRecord::Migration
  def self.up
    create_table :static_pages do |t|
      t.string  :title, :null => false
      t.text    :body
      t.string  :group, :null => false
      t.integer :user_id
      t.integer :position
    end
  end

  def self.down
    drop_table :static_pages
  end
end
