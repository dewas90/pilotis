class UserMailerPreview < ActionMailer::Preview
  def welcome
    user = User.first
    UserMailer.welcome(user).deliver_now
  end

  def invoice
    users = User.all
    UserMailer.invoice(users).deliver_now
  end

  def custom_message
    users = User.all
    UserMailer.custom_message(users, message).deliver_now
  end
end
