class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.activation_needed_email.subject
  #

  def activation_needed_email(user)
    @user = user
    @url  = "http://192.168.33.11:3000/users/#{user.activation_token}/activate"
    mail(:to => 'yamada@samubuc.co.jp',
         :subject => "Welcome to My Awesome Site")
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.activation_success_email.subject
  #
 
  def activation_success_email(user)
    @user = user
    @url  = "http://192.168.33.11:3000/login"
    mail(:to => user.email,
         :subject => "Your account is now activated")
  end

  def reset_password_email(user)
    @user = User.find user.id
    @url  = edit_password_reset_url(@user.reset_password_token)
    mail(:to => user.email, :subject => "Reset your password")
  end
end
