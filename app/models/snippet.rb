require 'digest/sha1'

class Snippet < ActiveRecord::Base

  # TODO: remove private_sha column

  belongs_to :language
  belongs_to :user
  before_create :generate_sha

  scope :find_public, lambda { |sha| where("private = 0 AND public_sha = ?", sha).limit(1) }
  scope :find_private, lambda { |sha| where("private = 1 AND public_sha = ?", sha).limit(1) }
  scope :public, where("private = 0").order("created_at DESC")

  def generate_sha
    sha = Digest::SHA1.hexdigest("--#{Time.now}--#{Kernel.rand}--")

    self.public_sha = if self.private
      sha[0..15]
    else
      sha[0..6]
    end
  end
end
