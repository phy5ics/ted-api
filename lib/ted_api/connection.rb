require 'faraday_middleware'
require 'faraday/response/raise_ted_api_error'

module Ted
  module Api
    module Connection
      private

      def connection(raw=false, force_urlencoded=false)
        url = "#{Ted::Api.api_endpoint}#{Ted::Api.api_version}"

        options = {
          url: url
        }

        connection = Faraday.new(options) do |builder|
          builder.request :json
          builder.use Faraday::Response::RaiseTedApiError
          unless raw
            builder.use FaradayMiddleware::Mashify
            builder.use FaradayMiddleware::ParseJson
          end
          builder.adapter *adapter
        end
        connection
      end
    end
  end
end
