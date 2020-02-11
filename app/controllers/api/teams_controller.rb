module Api
  class TeamsController < ApiController


    private

    def resource_class
      Team
    end

    def resource_params
      params.require(:team).permit(:user_id, :board_id, :is_admin)
    end
  end
end