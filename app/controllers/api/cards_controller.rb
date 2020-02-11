module Api
  class CardsController < ApiController


    private

    def resource_class
      Card
    end

    def resource_params
      params.require(:column).permit(:name, :background_color, :user_id, :column_id)
    end
  end
end