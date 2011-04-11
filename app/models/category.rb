class Category < ActiveRecord::Base
  has_many :categorizations
  has_many :posts, :through => :categorizations
  validates_uniqueness_of :name
  validates_presence_of :name
end
