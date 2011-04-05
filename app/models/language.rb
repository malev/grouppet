class Language < ActiveRecord::Base

  has_many :snippets

  def self.list_all
    languages ||= self.all.map { |lan| [lan.name, lan.id] }
  end
end
