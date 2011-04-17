require  'spec_helper'

describe Blog::BlogCommentsController do
  render_views
  before :each do
    @post = Factory('Blog::Post')
  end

  it "index action should render index template" do
    get :index, :post_id => @post.id
    response.should render_template(:index)
  end

  it "create action should render new template when model is invalid" do
    Blog::BlogComment.any_instance.stubs(:valid?).returns(false)
    post :create, :post_id => @post.id
    response.should redirect_to(blog_post_url(@post, :anchor => :comments))
  end

  it "create action should redirect when model is valid" do
    Blog::BlogComment.any_instance.stubs(:valid?).returns(true)
    post :create, :post_id => @post.id
    response.should redirect_to(blog_post_url(@post, :anchor => :comments))
  end

  it "edit action should render edit template" do
    @blog_comment = Factory('Blog::BlogComment')
    get :edit, :id => @blog_comment.id, :post_id => @post.id
    response.should render_template(:edit)
  end

  it "update action should render edit template when model is invalid" do
    @blog_comment = Factory('Blog::BlogComment')
    Blog::BlogComment.any_instance.stubs(:valid?).returns(false)
    put :update, :id => @blog_comment.id, :post_id => @post.id
    response.should render_template(:edit)
  end

  it "update action should redirect when model is valid" do
    @blog_comment = Factory('Blog::BlogComment')
    Blog::BlogComment.any_instance.stubs(:valid?).returns(true)
    put :update, :id => @blog_comment.id, :post_id => @post.id
    response.should redirect_to(blog_post_url(@post, :anchor => :comments))
  end

  it "destroy action should destroy model and redirect to index action" do
    @blog_comment = Factory('Blog::BlogComment')
    delete :destroy, :id => @blog_comment.id, :post_id => @post.id
    response.should redirect_to(blog_post_url(@post, :anchor => :comments))
    Blog::BlogComment.exists?(@blog_comment.id).should be_false
  end
end
