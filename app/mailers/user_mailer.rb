class UserMailer < ActionMailer::Base
  default from: "complimentnotifications@gmail.com"

  def welcome_email(user)
    @user = user
    @url = "http://compliment-mailbox.herokuapp.com/signin"
    mail(to: @user.email, subject: "Welcome to Compliment Mailbox!")
  end

  def compliment_email(compliment)
    @compliment = compliment
    @user = compliment.recipient
    @url = "http://compliment-mailbox.herokuapp.com"
    mail(to: @user.email, subject: "Someone just said something nice about you, #{@user.name}!")
  end
end
