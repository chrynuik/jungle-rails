class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def order_receipt_email(order)
    @order = order
    mail(to: order.email.to_s, subject: "Jungle-Rails Order: # #{@order.id}")

  end
end
