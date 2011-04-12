require  'spec_helper'

describe Blog::PostsController do
  render_views

  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end

  it "show action should render show template" do
    #@post = Factory(:post)#
    @post = Factory('Blog::Post')
    get :show, :id => @post.id
    response.should render_template(:show)
  end
end
