# Preview all emails at http://localhost:3000/rails/mailers/contact_mailer
class ContactMailerPreview < ActionMailer::Preview
  def contact_form_email
    @contact = params[:contact]
    mail(to: "rahulkeerthi2@gmail.com", subject: "You Have a Message From trycookit.com!")
  end

  def test_email
    ContactMailer.with(contact: Contact.first).contact_form_email
  end
end
