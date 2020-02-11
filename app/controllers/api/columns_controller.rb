module Api
  class ColumnsController < ApiController


    private

    def resource_class
      Column
    end

    def resource_params
      params.require(:column).permit(:name, :description, :background_color, :board_id)
    end
  end
end