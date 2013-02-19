require 'mail'

config = YAML.load_file('config/config.yml')

begin
  Mail.defaults do
    retriever_method :pop3, :address    => "#{config['mail']['server']}",
                            :port       => config['mail']['port'],
                            :user_name  => "#{config['mail']['username']}",
                            :password   => "#{config['mail']['password']}",
                            :enable_ssl => config['mail']['ssl']
  end
  emails = Mail.find(:what => :first, :count => 10, :order => :asc)
  puts emails.length #=> 10
  puts emails.first
rescue Exception => e
  puts "#{e.message}"
end