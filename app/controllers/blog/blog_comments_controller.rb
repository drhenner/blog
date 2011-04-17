class Blog::BlogCommentsController < ApplicationController
  def index
    @post = Blog::Post.includes(:blog_comments).find(params[:post_id])
    if current_user && current_user.blog_admin?
      @blog_comments = @post.blog_comments
    else
      redirect_to blog_post_url(@post, :anchor => "comments")
    end
  end

  def create
    @post = Blog::Post.includes(:blog_comments).find(params[:post_id])
    #@blog_comment = BlogComment.new(params[:blog_comment])
    @blog_comment = @post.blog_comments.build(params['blog_blog_comment'])
    @blog_comment.admin       = current_user && current_user.blog_admin?
    @blog_comment.user_ip     = request.remote_ip
    @blog_comment.user_agent  = request.user_agent
    @blog_comment.referrer    = request.referrer
    @blog_comment.permalink   = request.referrer

    @blog_comment.spam = @blog_comment.spam? if  !current_user.blog_admin?

    @blog_comment.post = @post
    if @post.commentable? && @blog_comment.save
      flash[:notice] = "Successfully created blog comment."
    end

    respond_to do |format|
      format.html { redirect_to blog_post_url(@post, :anchor => "comments") }
      format.js #still do this to fake out the human spammers - if spam, comment not saved
    end
  end

  def edit
    form_info
    @post = Blog::Post.includes(:blog_comments).find(params[:post_id])
    @blog_comment = Blog::BlogComment.find(params[:id])
    if current_user && current_user.blog_admin?
      render :action => 'edit'
    else
      redirect_to blog_post_url(@post, :anchor => "comments")
    end
  end

  def update
    @post = Blog::Post.includes(:blog_comments).find(params[:post_id])
    @blog_comment = Blog::BlogComment.find(params[:id])
    if current_user && current_user.blog_admin? && @blog_comment.update_attributes(params[:blog_blog_comment])
      flash[:notice] = "Successfully updated blog comment."
      redirect_to blog_post_url(@post, :anchor => "comments")
    else
      form_info
      render :action => 'edit'
    end
  end

  def destroy
    post = Blog::Post.find(params[:post_id])
    if current_user && current_user.blog_admin?
      blog_comment = Blog::BlogComment.find(params[:id])
      blog_comment.spam! if params[:mark_as_spam]
      blog_comment.destroy
      flash[:notice] = "Successfully destroyed blog comment."
    end
    redirect_to blog_post_url(post, :anchor => "comments")
  end

  private

  def form_info

  end
end
