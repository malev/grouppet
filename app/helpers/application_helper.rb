require 'digest/md5'

module ApplicationHelper
  def colorize(obj)
    require 'coderay'
    CodeRay.scan(obj.content, obj.language.name.downcase.to_sym).div(:line_numbers => :table)
  end
end
