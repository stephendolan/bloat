require "minitest/autorun"
require "template"

class BloatTest < Minitest::Test
  def test_invalid_url_fails
    template = Template.new(path: "not a URL")
    assert template.error == Template::ERROR_INVALID_URL
  end

  def test_invalid_content
    template = Template.new(path: "https://stephencodes.com")
    assert template.error == Template::ERROR_INVALID_CONTENT
  end

  def test_valid_run
    template = Template.new(path: "https://go.luckycasts.com/add-stimulus")
    assert template.error.nil?
  end
end
