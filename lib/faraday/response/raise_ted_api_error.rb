require 'faraday'
require 'multi_json'

module Faraday
  class Response::RaiseTedApiError < Response::Middleware
    def on_complete(response)
      case response[:status].to_i
      when 400
        raise Ted::Api::BadRequest, error_message(response)
      when 401
        raise Ted::Api::Unauthorized, error_message(response)
      when 403
        raise Ted::Api::Forbidden, error_message(response)
      when 404
        raise Ted::Api::NotFound, error_message(response)
      when 406
        raise Ted::Api::NotAcceptable, error_message(response)
      when 422
        raise Ted::Api::UnprocessableEntity, error_message(response)
      when 500
        raise Ted::Api::InternalServerError, error_message(response)
      when 501
        raise Ted::Api::NotImplemented, error_message(response)
      when 502
        raise Ted::Api::BadGateway, error_message(response)
      when 503
        raise Ted::Api::ServiceUnavailable, error_message(response)
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
