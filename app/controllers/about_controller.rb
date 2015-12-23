class AboutController < ApplicationController
  def index

  end

  def new
    @contact = ContactForm.new
  end

  def create
    @contact = ContactForm.new(params[:contact_form])

    if @contact.deliver
      flash.now[:success] = "Thank you for your message!"
    else
      flash.now[:danger] = "Could not send message."
      render "new"
    end
  end
end