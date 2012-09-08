require 'ted_api/version'
require 'ted_api/configuration'
require 'ted_api/client'
require 'ted_api/error'

module Ted
  module Api
    extend Configuration
    class << self
      # Alias for Ted::Api::Client.new
      #
      # @return [Ted::Api::Client]
      def new(options={})
        Ted::Api::Client.new(options)
      end

      # Delegate to Ted::Api::Client.new
      def method_missing(method, *args, &block)
        return super unless new.respond_to?(method)
        new.send(method, *args, &block)
      end

      def respond_to?(method, include_private=false)
        new.respond_to?(method, include_private) || super(method, include_private)
      end
    end
  end
end
