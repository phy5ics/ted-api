require 'ted-api/connection'
require 'ted-api/request'
require 'ted-api/error'

module Ted
  module Api
    class Client
      attr_accessor(*Configuration::VALID_OPTIONS_KEYS)

      def initialize(options={})
        options = Ted::Api.options.merge(options)
        Configuration::VALID_OPTIONS_KEYS.each do |key|
          send("#{key}=", options[key])
        end
      end
    end
  end
end