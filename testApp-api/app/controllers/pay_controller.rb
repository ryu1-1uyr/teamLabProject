class PayController <  ActionController::Base

  #post /products/pay
  def pay

    Payjp.api_key = 'sk_test_634284733603e1bf29ea3432'
    charge = Payjp::Charge.create(
        :amount => 3500,
        :card => params['payjp-token'],
        :currency => 'jpy',
        )

  end

end
