require 'faraday'
require 'multi_json'

module Faraday
  class Response::RaiseTedApiError < Response::Middleware
    def on_complete(response)
      case response[:status].to_i
      when 400
        raise TedApi::BadRequest, error_message(response)
      when 401
        raise TedApi::Unauthorized, error_message(response)
      when 403
        raise TedApi::Forbidden, error_message(response)
      when 404
        raise TedApi::NotFound, error_message(response)
      when 406
        raise TedApi::NotAcceptable, error_message(response)
      when 422
        raise TedApi::UnprocessableEntity, error_message(response)
      when 500
        raise TedApi::InternalServerError, error_message(response)
      when 501
        raise TedApi::NotImplemented, error_message(response)
      when 502
        raise TedApi::BadGateway, error_message(response)
      when 503
        raise TedApi::ServiceUnavailable, error_message(response)
      end
    end

    def error_message(response)
      message = if (body = response[:body]) && !body.empty?
        if body.is_a?(String)
          body = MultiJson.load(body, :symbolize_keys => true)
        end
        ": #{body[:error] || body[:message] || ''}"
      else
        ''
      end
      "#{response[:method].to_s.upcase} #{response[:url].to_s}: #{response[:status]}#{message}"
    end
  end
end
