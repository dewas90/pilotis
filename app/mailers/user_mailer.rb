class UserMailer < ApplicationMailer
  def welcome(user)
    @user = user  # Instance variable => available in view
    mail(to: @user.email, subject: 'Welcome to Pilotis')
    # This will render a view in `app/views/user_mailer`!
  end

  def invoice(users)
    users.each do |user|
      @user = user
      @invoices = @user.profile.invoices
      mail(to: @user.email, subject: 'Invoice')
    end
  end

end
