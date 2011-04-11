class Page < Entry
  scope :public_pages, where(:status => "published")
  scope :all_pages, all
  scope :this_page, lambda { |id| where(:id => id, :status => 'published') }
end
