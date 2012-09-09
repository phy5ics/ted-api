require 'spec_helper'

describe Ted::Api::Client do
  it 'should instantiate with api key' do
    proc {
      Ted::Api::Client.new(api_key: 'foo')
    }.should_not raise_exception
  end

  describe "api_endpoint" do
    after(:each) do
      Ted::Api.reset
    end

    it "should default to https://api.ted.com/" do
      client = Ted::Api::Client.new
      client.api_endpoint.should == 'https://api.ted.com/'
    end

    it "should be set " do
      Ted::Api.api_endpoint = 'http://foo.dev'
      client = Ted::Api::Client.new
      client.api_endpoint.should == 'http://foo.dev/'
    end
  end
end