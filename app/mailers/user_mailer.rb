class UserMailer < ActionMailer::Base
  default from: "complimentnotifications@gmail.com"

  def welcome_email(user)
    @user = user
    @url = "http://compliment-mailbox.herokuapp.com/signin"
    mail(to: @user.email, subject: "Welcome to Compliment Mailbox!")
  end
end
