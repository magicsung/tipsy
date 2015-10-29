class ContactMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_mailer.notify_contact.subject
  #
  def notify_contact( contact )
    @greeting = "Hi, Admin."
    @contact = contact

    mail to: "magicsung@gmail.com"
  end
end
