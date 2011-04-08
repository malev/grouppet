require 'digest/sha1'

class Snippet < ActiveRecord::Base

  # TODO: remove private_sha column

  belongs_to :language
  before_create :generate_sha

  scope :find_public, lambda { |sha| where("private = 0 AND public_sha = ?", sha).limit(1) }
  scope :find_private, lambda { |sha| where("private = 1 AND public_sha = ?", sha).limit(1) }
  scope :public, where("private = 0").order("created_at DESC")

  def colorize
    require 'coderay'
    CodeRay.scan(self.content, self.language.name.downcase.to_sym).div(:line_numbers => :table)
  end

  def generate_sha
    sha = Digest::SHA1.hexdigest("--#{Time.now.utc}--#{rand}--")
    self.public_sha = if self.private
      sha[0..15]
    else
      sha[0..6]
    end
  end
end
