module ApplicationHelper
  def admin_action(action)
    if admin_user?
      action
    end
  end
end
