class StaticPage < ActiveRecord::Base
  def self.about
    self.where(:title => 'about').first
  end
end
