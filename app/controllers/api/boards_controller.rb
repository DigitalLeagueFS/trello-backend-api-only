module Api
  class BoardsController < ApiController


    private

    def resource_class
      Board
    end

    def resource_params
      params.require(:board).permit(:name, :description, :background_img,
                                    :background_color, :progress)
    end
  end
end