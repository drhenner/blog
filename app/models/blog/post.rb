module Blog
  class Post < ActiveRecord::Base
    belongs_to :user
    has_many :blog_comments, :class_name => 'Blog::BlogComment'
    validate :title,  :presence => true
    validate :content,  :presence => true
    validate :markdown,  :presence => true
    validate :user_id,  :presence => true

    validate :state,  :presence => true

    before_save :create_content

    state_machine :state, :initial => :draft do
      state :draft
      state :closed
      state :active

      event :activate do
        transition all => :active, :unless => :active?
        #transition :from => :inactive,    :to => :active
      end

      event :inactivate do
        transition all => :draft, :unless => :draft?
        #transition :from => :inactive,    :to => :active
      end

      event :close_comments do
        transition all => :closed, :unless => :closed?
        #transition :from => :inactive,    :to => :active
      end
    end

    def display_posted_at
      posted_at ? posted_at.strftime("%b %d") : 'unknown'
    end

    def commentable?
      !closed?
    end

    private

    def create_content
      self.content = BlueCloth.new(self.markdown).to_html unless self.markdown.blank?
    end

  end
end
