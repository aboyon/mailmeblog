require 'rubygems'
require_relative 'lib/mailmeblog'

app = Mailmeblog::Filestore.new(Mailmeblog::config, Mailmeblog::mailer)

begin
  app.save_emails
rescue Exception => e
  puts "#{e.message}"
end