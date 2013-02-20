module Mailmeblog
  
  class Filestore

      def initialize(config, mail)
        @mailer = mail
        @config = config
      end

      def save_emails
        mails = @mailer.find(:what => :first, :count => 10, :order => :asc)
        if mails.length > 0
          mails.each do |mail|
            filename = "#{@config['store']['eml']}/#{Mailmeblog::sluglify(mail.subject)}"
            File.open(filename, 'w') { |file| file.write(mail) }
          end
        else
          raise Exception.new('There is not new emails to check!')
        end
      end
  end
end