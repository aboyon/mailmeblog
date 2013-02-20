module Mailmeblog

  def self.sluglify(text)
    text.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  end

end