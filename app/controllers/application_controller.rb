class ApplicationController < ActionController::Base
  helper_method :current_team

  def current_team
    Team.find(current_user.active_team)
  end
end
