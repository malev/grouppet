class AddingLanguageIdToSnippets < ActiveRecord::Migration
  def self.up
    add_column :snippets, :language_id, :integer
    remove_column :snippets, :language
  end

  def self.down
    remove_column :snippets, :language_id
    add_column :snippets, :language, :string
  end
end
