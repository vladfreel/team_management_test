class DashboardController < ApplicationController
  def index
  end

  def set_current_team
    current_user.update(active_team: params[:team_id])
    redirect_to dashboard_index_path
  end
end
