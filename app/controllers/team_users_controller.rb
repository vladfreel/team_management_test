class TeamUsersController < ApplicationController
  def create
    @team_user = TeamUser.new(team_user_params)
    if @team_user.save
      redirect_to teams_path(@team), notice: "User invited successfully."
    else
      redirect_to teams_path(@team), notice: "User invited failed."
    end
  end

  private

  def team_user_params
    params.require(:team_user).permit(:user_id, :team_id, :role_id)
  end
end
