class Snippet < ActiveRecord::Base
  belongs_to :language

  def colorize
    require 'coderay'
    CodeRay.scan(self.content, self.language.name.downcase.to_sym).div(:line_numbers => :table)
  end
end
