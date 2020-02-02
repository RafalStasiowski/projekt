class UserMailer < ApplicationMailer

  default :from => "slazaczka@gmail.com"

  def welcome_email(user)
    @user = user
    attachments.inline['logo3.png'] = File.read("app/assets/images/logo3.png")
    mail(:to => @user.email, :subject => "Witamy w ślązaczce")
  end

  def order_email(user, items)
    @current_order = JSON.parse(items)
    @user = user
    @order = @user.orders.last.id
    attachments.inline['logo3.png'] = File.read("app/assets/images/logo3.png")
    mail(:to => @user.email, :subject => "Twoje zamówienie:#{@order} jest w trakcie realizacji")
  end

  def status_email(order)
    @order = order
    @status = @order.Status
    @user = User.find(@order.user_id)
    attachments.inline['logo3.png'] = File.read("app/assets/images/logo3.png")
    mail(:to => @user.email, :subject => "Twoje zamówienie:#{@order.id} jest teraz #{@status}")
  end

end
