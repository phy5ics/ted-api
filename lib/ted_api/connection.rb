require 'faraday_middleware'
require 'faraday/response/raise_ted_api_error'

module TedApi
  module Connection
    private

    def connection(raw=false, force_urlencoded=false)
      url = "#{TedApi.api_endpoint}#{TedApi.api_version}"

      options = {
        url: url
      }
      
      connection = Faraday.new(options) do |builder|
        builder.use Faraday::Response::RaiseTedApiError
        unless raw
          builder.use FaradayMiddleware::Mashify
          if response_format == 'json'
            builder.use FaradayMiddleware::ParseJson
          elsif response_format == 'xml'
            builder.use FaradayMiddleware::ParseXml
          end
        end
        builder.adapter *adapter
      end
      connection
    end
  end
end