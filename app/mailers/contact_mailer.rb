class ContactMailer < ApplicationMailer
  def contact_form_email
    @contact = params[:contact]
    mail(to: "rahulkeerthi2@gmail.com", subject: "You Have a Message From trycookit.com!")
  end
end
