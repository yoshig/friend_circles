class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def reset_password_email(user, password)
    @password = password
    @user = user
    @url = "localhost:3000/session/new"
    mail(to: user.email, subject: "Reset your Password")
  end
end
