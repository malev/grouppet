class Entry < ActiveRecord::Base
  belongs_to :user
  validates_uniqueness_of :name
  validates_presence_of   :name

  has_friendly_id :name, :use_slug => true
end
