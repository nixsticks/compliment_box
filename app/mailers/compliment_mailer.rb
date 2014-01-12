class ComplimentMailer < ActionMailer::Base
  default from: "complimentnotifications@gmail.com"

  def compliment_email(compliment)
    @compliment = compliment
    @user = compliment.recipient
    @url = "http://compliment-mailbox.herokuapp.com"
    mail(to: @user.email, subject: "Someone just said something nice about you, #{@user.name}!")
  end
end