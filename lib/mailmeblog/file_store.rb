module Mailmeblog
  
  class Filestore

      def initialize(config, mail)
        @mailer = mail
        @config = config
      end

      def save_emails
        mails = @mailer.find(:what => :first, :count => 10, :order => :asc)
        if mails.length > 0
          emls = []
          mails.each do |mail|
            filename = "#{@config['store']['eml']}/#{Mailmeblog::sluglify(mail.subject)}.eml"
            File.open(filename, 'w') { |file| file.write(mail) }
            emls << mail
          end
          emls
        else
          raise Exception.new('There is not new emails to check!')
        end
      end

      def convert_to_entries
        save_emails.each do |mail|
          filename = "#{@config['store']['html']}/#{Mailmeblog::sluglify(mail.subject)}.html"
          html = "<h3>#{Mailmeblog::convert_encoding(mail.subject)}</h3>"
          html.concat("\n")
          mail.body.decoded.split("\n").each do |paragraph|
            unless paragraph.blank?
              html.concat("\n")
              html.concat("<p>#{Mailmeblog::convert_encoding(paragraph)}</p>")
              html.concat("\n")
            end
          end
          File.open(filename, 'w') { |file| file.write(html) }
        end
      end
  end
end