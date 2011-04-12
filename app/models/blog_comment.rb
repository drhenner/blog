#module Blog
  class BlogComment < ActiveRecord::Base
    belongs_to :post#, :class_name => 'Blog::Post'
  end
#end
