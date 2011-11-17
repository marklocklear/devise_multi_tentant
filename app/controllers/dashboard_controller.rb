class DashboardController < ApplicationController
  def index
    @users = User.get_users(current_user.organization)
  end
end
