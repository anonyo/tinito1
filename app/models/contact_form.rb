class ContactForm < MailForm::Base

  attribute :name, validate: true
  attribute :email, validate: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message, validate: true

  def headers
    {
        subject: "tinito - Contact Request",
        to: "erivas78@gmail.com",
        from: "erivas78@me.com"
    }
  end
end