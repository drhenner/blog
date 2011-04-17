module Blog
  class BlogComment < ActiveRecord::Base
    include Rakismet::Model

    validates :content, :presence => true,
                        :length => {:minimum => 5}

    belongs_to :post, :class_name => 'Blog::Post'

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
  end
end
