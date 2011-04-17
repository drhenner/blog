module Blog
  class BlogComment < ActiveRecord::Base
    include Rakismet::Model

    validates :post_id, :presence => true
    validates :content, :presence => true,
                        :length => {:minimum => 5}

    belongs_to :post, :class_name => 'Blog::Post'

    validate     :ensure_not_closed
    before_save :sanitize_data
    attr_accessible :name, :email, :website, :content
    rakismet_attrs :author => :name,
                   :author_email => :email,
                   :author_url => :website

    protected

    def sanitize_data
      self.name = 'Anonymous' unless self.name.present?
      self.email.downcase     if self.email.present?
      self.website.downcase   if self.website.present?
      self.email.downcase     if self.email.present?
      self.email.downcase     if self.email.present?
    end

    def ensure_not_closed
      if !post || post.closed?
        self.errors.add(:base, 'Sorry this post is closed for comments.')
      end
    end
  end
end
