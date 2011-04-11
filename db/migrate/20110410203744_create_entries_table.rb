class CreateEntriesTable < ActiveRecord::Migration
  def self.up
    create_table :entries do |t|
      t.string  :name
      t.text    :body
      t.string  :stauts
      t.string  :type
      t.integer :user_id
      t.integer :revision, :default => 0
      t.timestamps
    end
  end

  def self.down
    drop_table :entries
  end
end
