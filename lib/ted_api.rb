require 'ted_api/version'
require 'ted_api/configuration'
require 'ted_api/client'
require 'ted_api/error'

module TedApi
  extend Configuration
  class << self
    # Alias for TedApi::Client.new
    #
    # @return [TedApi::Client]
    def new(options={})
      TedApi::Client.new(options)
    end

    def respond_to?(method, include_private=false)
      new.respond_to?(method, include_private) || super(method, include_private)
    end
  end
end
