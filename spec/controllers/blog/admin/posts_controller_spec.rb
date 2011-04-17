require  'spec_helper'

describe Blog::Admin::PostsController do
  render_views

  before(:each) do
    #current_user = mock('user')
    #current_user.stubs(:blog_admin?).returns(true)
  end

  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end

  it "show action should render show template" do
    @post = Factory('Blog::Post')
    get :show, :id => @post.id
    response.should render_template(:show)
  end

  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end

  it "create action should render new template when model is invalid" do
    Blog::Post.any_instance.stubs(:valid?).returns(false)
    post :create
    response.should render_template(:new)
  end

  it "create action should redirect when model is valid" do
    Blog::Post.any_instance.stubs(:valid?).returns(true)
    post :create
    response.should redirect_to(blog_admin_post_url(assigns[:post]))
  end

  it "edit action should render edit template" do
    @post = Factory('Blog::Post')
    get :edit, :id => @post.id
    response.should render_template(:edit)
  end

  it "update action should render edit template when model is invalid" do
    @post = Factory('Blog::Post')
    Blog::Post.any_instance.stubs(:valid?).returns(false)
    put :update, :id => @post.id
    response.should render_template(:edit)
  end

  it "update action should redirect when model is valid" do
    @post = Factory('Blog::Post')
    Blog::Post.any_instance.stubs(:valid?).returns(true)
    put :update, :id => @post.id
    response.should redirect_to(blog_admin_post_url(assigns[:post]))
  end

  it "destroy action should destroy model and redirect to index action" do
    @post = Factory('Blog::Post')
    delete :destroy, :id => @post.id
    response.should redirect_to(blog_admin_posts_url)
    Blog::Post.exists?(@post.id).should be_false
  end
end
