class AddPublicAndPrivateShaToSnippets < ActiveRecord::Migration
  def self.up
    add_column :snippets, :public_sha, :string
    add_column :snippets, :private_sha, :string
  end

  def self.down
    remove_column :snippets, :public_sha
    remove_column :snippets, :private_sha
  end
end
