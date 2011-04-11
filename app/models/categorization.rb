class Categorization < ActiveRecord::Base
  belongs_to :post, :foreign_key => :entry_id
  belongs_to :category
end
