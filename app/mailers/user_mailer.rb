class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def reset_password_email(user)
    @user = user
    @url = "localhost:3000/users/#{@user.id}/reset_password/edit"
    mail(to: user.email, subject: "Reset your Password")
  end
end
