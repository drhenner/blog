require  'spec_helper'

describe Blog::SpamsController do
  render_views

  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end

  it "show action should render show template" do
    @spam = Factory('Blog::BlogComment')
    get :show, :id => @spam.id
    response.should render_template(:show)
  end

  it "edit action should render edit template" do
    @spam = Factory('Blog::BlogComment')
    get :edit, :id => @spam.id
    response.should render_template(:edit)
  end

  it "update action should render edit template when model is invalid" do
    @spam = Factory('Blog::BlogComment')
    Blog::BlogComment.any_instance.stubs(:valid?).returns(false)
    put :update, :id => @spam.id
    response.should render_template(:edit)
  end

  it "update action should redirect when model is valid" do
    @spam = Factory('Blog::BlogComment')
    Blog::BlogComment.any_instance.stubs(:valid?).returns(true)
    put :update, :id => @spam.id
    response.should redirect_to(blog_spam_url(assigns[:spam]))
  end

  it "destroy action should destroy model and redirect to index action" do
    @spam = Factory('Blog::BlogComment')
    delete :destroy, :id => @spam.id
    response.should redirect_to(blog_spams_url)
    Blog::BlogComment.exists?(@spam.id).should be_false
  end
end
