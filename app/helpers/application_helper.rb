require 'digest/md5'

module ApplicationHelper
  def colorize(obj)
    require 'coderay'
    CodeRay.scan(obj.content, obj.language.name.downcase.to_sym).div(:line_numbers => :table)
  end

  def gravatar_url_for(email, options = {})
    url_for({ :gravatar_id => Digest::MD5.hexdigest(email),
              :host => 'www.gravatar.com',
              :protocol => 'http://',
              :only_path => false,
              :controller => 'avatar.php'
            }.merge(options))
  end
end
