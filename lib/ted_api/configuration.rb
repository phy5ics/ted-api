require 'faraday'
require 'ted_api/version'

module TedApi
  module Configuration
    VALID_OPTIONS_KEYS = [
      :adapter,
      :api_version,
      :api_endpoint,
      :web_endpoint,
      :api_key,
      :response_format,
      :user_agent].freeze

    DEFAULT_ADAPTER = Faraday.default_adapter
    DEFAULT_API_VERSION = 'v1'
    DEFAULT_API_ENDPOINT = 'https://api.ted.com/'
    DEFAULT_WEB_ENDPOINT = 'https://ted.com/'
    DEFAULT_USER_AGENT = "ted-api ruby gem #{TedApi::VERSION}".freeze
    DEFAULT_RESPONSE_FORMAT = 'json'

    attr_accessor(*VALID_OPTIONS_KEYS)

    def self.extended(base)
      base.reset
    end

    def configure
      yield self
    end

    def options
      VALID_OPTIONS_KEYS.inject({}){|o,k| o.merge!(k => send(k)) }
    end

    def api_endpoint=(value)
      @api_endpoint = File.join(value, "")
    end

    def web_endpoint=(value)
      @web_endpoint = File.join(value, "")
    end

    def reset
      self.adapter = DEFAULT_ADAPTER
      self.api_version = DEFAULT_API_VERSION
      self.api_endpoint = DEFAULT_API_ENDPOINT
      self.web_endpoint = DEFAULT_WEB_ENDPOINT
      self.api_key = nil
      self.response_format = DEFAULT_RESPONSE_FORMAT
      self.user_agent = DEFAULT_USER_AGENT
    end
  end
end