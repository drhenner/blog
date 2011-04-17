require 'spec_helper'

describe Blog::Post do
  context 'instance methods' do
    context 'display_posted_at' do


      it 'should display unknown' do
        @post = Factory.build('Blog::Post', :posted_at => nil)
        @post.display_posted_at.should == 'unknown'
      end

      it 'should diplay the date' do
        time_now = Time.zone.now
        @post = Factory.build('Blog::Post', :posted_at => time_now)
        @post.display_posted_at.should == time_now.strftime("%b %d")
      end
    end
    context 'commentable?' do
      it 'should be false if the state is closed' do
        @post = Factory.build('Blog::Post', :state => 'closed')
        @post.commentable?.should be_false
      end
      it 'should be false if the state is not closed' do
        @post = Factory.build('Blog::Post', :state => 'draft')
        @post.commentable?.should be_true
      end
    end

  end

end
