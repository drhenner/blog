module Blog
  class BlogComment < ActiveRecord::Base
    belongs_to :post, :class_name => 'Blog::Post'

    before_save :sanitize_data


    protected

    def sanitize_data
      self.name = 'Anonymous' unless self.name.present?
    end
  end
end
