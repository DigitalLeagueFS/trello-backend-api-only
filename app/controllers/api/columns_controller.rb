module Api
  class ColumnsController < ApiController

    def index
      if params[:board_id]
        @columns = Column.where(:board_id => params[:board_id])
        render json: @columns.to_json, status: :ok
      else
        @columns = Column.all
        render json: @columns.to_json, status: :ok
      end
    end

    private

    def resource_class
      Column
    end

    def resource_params
      params.require(:column).permit(:name, :description, :background_color, :board_id)
    end
  end
end