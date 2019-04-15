class Contact < MailForm::Base
  attribute :full_name,       :validate => true
  attribute :email,           :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message_content, :validate => true

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      :subject => "Question Client",
      :to => "nelly@contact.com",
      :from => %("#{full_name}" <#{email}>)
    }
  end
end
