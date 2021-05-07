class ThanksMailer < ApplicationMailer
  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: ' 会員登録が完了しました')
  end
end