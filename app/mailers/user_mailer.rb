class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def order_receipt_email(order)
    @order = order
    #@user = user
    #@url  = 'http://example.com/login'
    mail(to: order.email.to_s, subject: 'Your order #{@order.id}')

  end
end
