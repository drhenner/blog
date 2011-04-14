class Blog::Admin::PostsController < ApplicationController
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
    if @post.update_attributes(params[:post])
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

  def form_info

  end
end
