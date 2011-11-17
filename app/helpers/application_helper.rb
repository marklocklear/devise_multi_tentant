module ApplicationHelper
  def current_organization
    current_user.organization
  end
end
