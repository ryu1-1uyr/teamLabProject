class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :update, :destroy]

  # GET /orders
  def index
    @orders = Order.all

    render json: @orders
  end

  # GET /orders/1
  def show
    render json: @order
  end

  def create_settlement
    @settlement = SettlementTable.new(order_id: @order["id"])
    #settlement_stateがnullになってるけど、payjpと連携した後に、トークン渡して入金確認したらstate書き換える感じにしたい
    @settlement.save

  end

  # POST /orders
  def create
    @order = Order.new(order_params)

    if @order.save
      render json: @order, status: :created, location: @order
      #settlement_table作成の処理

      create_settlement

    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /orders/1
  def update
    if @order.update(order_params)
      render json: @order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  # DELETE /orders/1
  def destroy
    @order.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    # require(:order)消したら動く{oeder:{product_id:1}}みたいなjsonでおくればいい
    def order_params
      params.require(:order).permit(:product_id, :how_many_buy, :address, :user_name)
    end
end
