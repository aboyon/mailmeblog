module Mailmeblog

  def self.sluglify(text)
    text.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  end

  def self.convert_encoding(text)
    HTMLEntities.new.encode(text.force_encoding("ISO-8859-1").encode("utf-8", replace: nil), :named)
  end

end