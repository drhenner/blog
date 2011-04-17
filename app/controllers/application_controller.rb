class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user

  private
  def current_user
    return @current_user if defined?(@current_user)
    @current_user = User.new
  end

  class User

    def blog_admin?
      true
    end

    def id
      1
    end

    def blog_name
      'Dave Blogger'
    end

    def initials
      'DB'
    end

    def email
      'dhenner@yahoo.com'
    end
  end
end
