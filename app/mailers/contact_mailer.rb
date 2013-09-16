class ContactMailer < ActionMailer::Base
  default to: 'contato@guiavendamais.com.br'

  def contact_mail(hash)
    @name = hash[:name]
    #@email = hash[:email]
    @email = "contato@guiavendamais.com.br"
    @message = hash[:message]

    mail(from: @email, subject: "[#{ENV['APP_HOSTNAME']}] #{@name}")
  end
end
