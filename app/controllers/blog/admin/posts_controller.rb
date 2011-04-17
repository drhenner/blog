class Blog::Admin::PostsController < ApplicationController
  before_filter :ensure_blog_admin
  layout 'blog'

  def index
    @posts = Blog::Post.all
  end

  def show
    @post = Blog::Post.find(params[:id])
  end

  def new
    form_info
    @post = Blog::Post.new
  end

  def create
    @post = Blog::Post.new(params['Blog::Post'])
#    @post.user = current_user
    @post.posted_at = Time.zone.now
    @post.state = 'draft' if params[:save_draft].present?

    if @post.save
      flash[:notice] = "Successfully created post."
      redirect_to blog_admin_post_url(@post)
    else
      form_info
      render :action => 'new'
    end
  end

  def edit
    form_info
    @post = Blog::Post.find(params[:id])
  end

  def update
    @post = Blog::Post.find(params[:id])

    @post.state = 'draft' if params[:draft_submit].present?
    @post.state = 'active' if params[:activate_submit].present?
    @post.state = 'closed' if params[:close_submit].present?

    if @post.update_attributes(params["Blog::Post"])
      flash[:notice] = "Successfully updated post."
      redirect_to blog_admin_post_url(@post)
    else
      form_info
      render :action => 'edit'
    end
  end

  def destroy
    @post = Blog::Post.find(params[:id])
    @post.destroy
    flash[:notice] = "Successfully destroyed post."
    redirect_to blog_admin_posts_url
  end

  private

  def ensure_blog_admin
    redirect_to blog_posts_path and return if !current_user || !current_user.blog_admin?
  end

  def form_info

  end
end
