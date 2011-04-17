require 'spec_helper'

describe Blog::BlogComment do

  context 'instance methods' do
    context 'sanitize_data' do
      it 'should display unknown' do
        @post = Factory.build('Blog::BlogComment', :name => nil)
        @post.save.should be_true
        @post.name.should == 'Anonymous'
      end
    end

  end
end
