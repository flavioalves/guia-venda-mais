class ContactMailer < ActionMailer::Base
  default to: 'admin@example.com'

  def contact_mail(hash)
    @name = hash[:name]
    #@email = hash[:email]
    @email = "contato@guiavendamais.com.br"
    @message = hash[:message]

    mail(from: @email, subject: "[#{ENV['APP_HOSTNAME']}] #{@name}")
  end
end
