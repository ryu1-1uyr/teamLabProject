class RecommendedItemsController < ApplicationController
  before_action :set_recommended_item, only: [:show, :update, :destroy]

  # GET /recommended_items
  def index
    @recommended_items = RecommendedItem.all

    render json: @recommended_items
  end

  # GET /recommended_items/1
  def show
    render json: @recommended_item
  end

  # POST /recommended_items
  def create
    @recommended_item = RecommendedItem.new(recommended_item_params)

    if @recommended_item.save
      render json: @recommended_item, status: :created, location: @recommended_item
    else
      render json: @recommended_item.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /recommended_items/1
  def update
    if @recommended_item.update(recommended_item_params)
      render json: @recommended_item
    else
      render json: @recommended_item.errors, status: :unprocessable_entity
    end
  end

  # DELETE /recommended_items/1
  def destroy
    @recommended_item.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recommended_item
      @recommended_item = RecommendedItem.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def recommended_item_params
      params.require(:recommended_item).permit(:puroduct_id)
    end
end
