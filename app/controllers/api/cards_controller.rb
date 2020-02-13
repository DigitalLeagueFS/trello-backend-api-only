module Api
  class CardsController < ApiController


    def index
      if params[:column_id]
        @cards = Card.where(:column_id => params[:column_id])
        render json: @cards.to_json, status: :ok
      else
        @cards = Card.all
        render json: @cards.to_json, status: :ok
      end
    end

    private

    def resource_class
      Card
    end

    def resource_params
      params.require(:column).permit(:name, :background_color, :user_id, :column_id)
    end
  end
end