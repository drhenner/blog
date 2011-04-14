class Blog::PostsController < ApplicationController
  layout 'blog'

  def index
    @posts = Blog::Post.order("posted_at DESC").page(page_num).per(12)
    respond_to do |format|
      format.html
      format.rss { render :layout => false } #index.rss.builder
    end
  end

  def show
    @post     = Blog::Post.find(params[:id])
    @comment  = @post.blog_comments.build
  end

  private

  def page_num
    (params[:page_num].present? && (params[:page_num].to_i > 0)) ? params[:page_num].to_i : 1
  end

  def form_info

  end
end
#rails g nifty:scaffold blog/admin/post