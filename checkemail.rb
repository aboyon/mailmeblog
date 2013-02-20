require 'rubygems'
require_relative 'lib/mailmeblog'

app = Mailmeblog::Filestore.new(Mailmeblog::config, Mailmeblog::mailer)

begin
  app.convert_to_entries
rescue Exception => e
  puts "#{e.message}"
end