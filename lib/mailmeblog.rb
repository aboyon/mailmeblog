module Mailmeblog
  
  require 'mail'
  require 'fileutils'

  Dir["lib/helpers/*.rb", "lib/mailmeblog/*.rb"].each { |file| 
    require "#{Dir.pwd}/#{file}"
  }

  def self.config
    YAML.load_file('config/config.yml')
  end

  def self.mailer
    Mail
  end

  Mail.defaults do
    config = Mailmeblog.config
    retriever_method :pop3, 
      :address    => "#{config['mail']['server']}",
      :port       => config['mail']['port'],
      :user_name  => "#{config['mail']['username']}",
      :password   => "#{config['mail']['password']}",
      :enable_ssl => config['mail']['ssl']
  end
  
  unless File.directory?("#{Mailmeblog.config['store']['eml']}")
    FileUtils.mkdir_p "#{config['store']['eml']}"
  end


end