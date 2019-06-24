class Contact < MailForm::Base
  attribute :email,           :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :full_name,       :validate => true
  attribute :message_content, :validate => true

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      :subject => "Question Client",
      :to => "#{Company.instance.email}",
      :from => %("#{full_name}" <#{email}>)
    }
  end
end
