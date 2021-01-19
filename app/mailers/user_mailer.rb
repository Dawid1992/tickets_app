class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.ticket_confirmation.subject
  #
  def ticket_confirmation(user)
    @user = user
    mail to: @user.email, subject: "Ticket confirmation"
  end
end
