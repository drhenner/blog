module ApplicationHelper

  def site_name
    'RoR Blog Engine'
  end

  def not_admin_user?
    !current_user || !current_user.admin?
  end

  def admin_user?
    current_user && current_user.admin?
  end
end
