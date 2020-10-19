require "net/http"
require "uri"

class Template
  attr_reader :path
  attr_reader :error

  ERROR_INVALID_URL = "You've provided an invalid URL."
  ERROR_INVALID_CONTENT = "Your URL needs to resolve to a Thor-supported template, and can't contain things like HTML tags."

  def initialize(path:)
    @path = path
    @error = nil

    validate_path
  end

  private

  def validate_path
    unless working_url?
      @error = ERROR_INVALID_URL
      return
    end

    unless valid_content?
      @error = ERROR_INVALID_CONTENT
    end
  end

  def working_url?
    uri = URI.parse(path)
    uri.is_a?(URI::HTTP) && !uri.host.nil?
  rescue URI::InvalidURIError
    false
  end

  def valid_content?
    content = Net::HTTP.get(URI.parse(path))

    invalid_patterns = [
      /<html.*>/,
      /<!DOCTYPE html.*>/
    ]

    !content.match?(Regexp.union(invalid_patterns))
  end
end
