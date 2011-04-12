module Blog
  class BlogComments < ActiveRecord::Base
    belongs_to :post
  end
end
