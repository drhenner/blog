# Blog Engine - overview

The first thing you will need to have in your current app is a user class that responds to the following methods.

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
