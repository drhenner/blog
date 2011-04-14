class Blog::SpamsController < ApplicationController
  def index
    @spams = Blog::BlogComment.where(['spam = ?', false])
  end

  def show
    @spam = Blog::BlogComment.find(params[:id])
  end

  def edit
    form_info
    @spam = Blog::BlogComment.find(params[:id])
  end

  def update
    @spam = Blog::BlogComment.find(params[:id])
    if @spam.update_attributes(params[:spam])
      flash[:notice] = "Successfully updated spam."
      redirect_to blog_spam_url(@spam)
    else
      form_info
      render :action => 'edit'
    end
  end

  def destroy
    @spam = Blog::BlogComment.find(params[:id])
    @spam.destroy
    flash[:notice] = "Successfully destroyed spam."
    redirect_to blog_spams_url
  end

  private

  def form_info

  end
end
