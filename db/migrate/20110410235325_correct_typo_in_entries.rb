class CorrectTypoInEntries < ActiveRecord::Migration
  def self.up
    remove_column :entries, :stauts
    add_column :entries, :status, :string, :default => "draft"
  end

  def self.down
  end
end
