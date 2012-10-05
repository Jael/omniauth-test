class UserMailer < ActionMailer::Base
  default from: "cutejael@gmail.com"
  def sign_up_email(user)
    @user = user
    @url = user_posts_url(@user, host: 'localhost')
    mail to: @user.email, subject: 'Welcome'
  end
end
