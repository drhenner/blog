#module Blog
  class Post < ActiveRecord::Base
    # belongs_to :user
    has_many :blog_comments#, :class_name => 'Blog::BlogComment'
  end
#end
