class UserMailer < ApplicationMailer
  def welcome(user)
    @user = user  # Instance variable => available in view
    mail(to: @user.email, subject: 'Welcome to Pilotis')
    # This will render a view in `app/views/user_mailer`!
  end

  def invoice(user)
    @user = user
    @invoice = @user.profile.invoices.last
    mail(to: @user.email, subject: 'Invoice')
  end

  def custom_message(user, message)
    @user = user
    @message = message
    mail(to: @user.email, subject: 'Custom message')
  end
end
