class PayController <  ActionController::Base

  protect_from_forgery except: :pay

  def index

  end

  #post /products/pay
  def pay

    Payjp.api_key = "sk_test_634284733603e1bf29ea3432"
    charge = Payjp::Charge.create(
        :amount => params['price'],
        :card => params['payjp-token'],
        :currency => 'jpy',
        )

    #DBにあれこれ登録する処理とかを書く
    @settlement = SettlementTable.find_by(order_id: params['order_id'])#params[:order_id]

    @settlement.namsettlement_state = "payed!!"

    @settlement.save


    redirect_to("/tester")

  end

end
