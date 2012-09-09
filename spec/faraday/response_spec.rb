# -*- encoding: utf-8 -*-
require 'spec_helper'

describe Faraday::Response do
  before do
    @client = TedApi::Client.new(api_key: 'foo')
  end

  {
    400 => TedApi::BadRequest,
    401 => TedApi::Unauthorized,
    403 => TedApi::Forbidden,
    404 => TedApi::NotFound,
    406 => TedApi::NotAcceptable,
    422 => TedApi::UnprocessableEntity,
    500 => TedApi::InternalServerError,
    501 => TedApi::NotImplemented,
    502 => TedApi::BadGateway,
    503 => TedApi::ServiceUnavailable,
  }.each do |status, exception|
    context "when HTTP status is #{status}" do

      before do
        stub_get('talks.json?api-key=foo').
          to_return(:status => status)
      end

      it "should raise #{exception.name} error" do
        lambda do
          @client.talks
        end.should raise_error(exception)
      end
    end
  end
end