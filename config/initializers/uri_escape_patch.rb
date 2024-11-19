require 'uri'

module URI
  def self.escape(string)
    ::URI::DEFAULT_PARSER.escape(string)
  end
end
