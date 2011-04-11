class Post < Entry
  has_many :categorizations
  has_many :categories, :through => :categorizations
  scope :show_public_posts, where(:status => 'published').order("created_at desc")
end
