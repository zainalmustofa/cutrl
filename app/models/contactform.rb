# == Schema Information
#
# Table name: contactforms
#
#  id         :integer          not null, primary key
#  name       :string           default(""), not null
#  email      :string           default(""), not null
#  type       :string           default(""), not null
#  message    :text             default(""), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Contactform < MailForm::Base
  attribute :name,      :validate => true
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message,   :validate => true
  attribute :type,      :validate => true
  attribute :name,  :captcha  => true

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      :subject => "My Contact Form",
      :to => "zainalmustof@gmail.com",
      :from => %("#{name}" <#{email}>)
    }
  end
end