module Api
  class TeamsController < ApiController

    def index
      if params[:user_id]
        @teams = Team.where(:user_id => params[:user_id])
        render json: @teams.to_json, status: :ok
      else
        @teams = Team.all
        render json: @teams.to_json, status: :ok
      end
    end

    private

    def resource_class
      Team
    end

    def resource_params
      params.require(:team).permit(:user_id, :board_id, :is_admin)
    end
  end
end