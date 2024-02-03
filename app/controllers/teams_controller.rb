class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource # This will automatically authorize all actions based on the Ability class

  # GET /teams
  def index
    @teams = Team.where("owner_id = ? OR id IN (SELECT team_id FROM team_users WHERE user_id = ?)", current_user.id, current_user.id)
  end

  # GET /teams/1
  def show
    @team_users_ids = @team.team_users.pluck(:user_id)
    @team_owner_id = @team.owner_id
    @users = User.where.not(id: @team_users_ids).where.not(id: @team_owner_id)
  end

  # GET /teams/new
  def new
    @team = Team.new
  end

  # GET /teams/1/edit
  def edit
  end

  # POST /teams
  def create
    @team = Team.new(team_params)
    @team.owner = current_user

    if @team.save!
      redirect_to @team, notice: "Team was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /teams/1
  def update
    if @team.update(team_params)
      redirect_to @team, notice: "Team was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /teams/1
  def destroy
    @team.destroy
    redirect_to teams_url, notice: "Team was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_team
    @team = Team.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def team_params
    params.require(:team).permit(:name, :description)
  end
end
