class Post < Entry
  has_many :categorizations
  has_many :categories, :through => :categorizations
  scope :show_public_posts, where(:status => 'published').order("created_at desc")
  scope :blogger, where("status = ?", 'published').order("created_at desc")

  paginates_per 20
end
