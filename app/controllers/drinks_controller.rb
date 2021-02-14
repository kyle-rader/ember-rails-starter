class DrinksController < ApplicationController
  before_action :set_drink, only: [:show, :update, :destroy]

  # GET /drinks
  def index
    @drinks = Drink.select("id, title").all

    render json: @drinks
  end

  # GET /drinks/:id
  def show
    render json: @drink.to_json(:include => {
      :ingredients => {
        :only => [:id, :description]
      }
    })
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_drink
      @drink = Drink.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def drink_params
      params.require(:drink).permit(:title, :description, :steps, :source)
    end
end
