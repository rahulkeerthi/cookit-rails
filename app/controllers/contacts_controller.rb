class ContactsController < ApplicationController
  invisible_captcha only: [:create]
  skip_before_action :authenticate_user!


  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      ContactMailer.with(contact: @contact).contact_form_email.deliver
      flash[:notice] = "Message successfully sent! Thank you!"
      redirect_to :root
    else
      render 'pages/contact'
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :message, :last_name)
  end
end
