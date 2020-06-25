require "thor"

require "bloat/version"
require "template"

module Bloat
  class Error < StandardError; end

  class CLI < Thor
    include Thor::Actions

    def self.exit_on_failure?
      true
    end

    desc "with [TEMPLATE_URL]", "run a template"
    def with(template_url)
      template = Template.new(path: template_url)
      raise Thor::Error, template.error unless template.error.nil?

      apply(template_url)
    end
  end
end
