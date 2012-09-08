unless ENV['CI']
  require 'simplecov'
  SimpleCov.start do
    add_filter "/spec"
  end
end
require 'ted_api'
require 'rspec'
require 'webmock/rspec'

def a_get(url)
  a_request(:get, ted_url(url))
end

def a_post(url)
  a_request(:post, ted_url(url))
end

def stub_get(url)
  stub_request(:get, ted_url(url))
end

def stub_post(url)
  stub_request(:post, ted_url(url))
end

def stub_put(url)
  stub_request(:put, ted_url(url))
end

def fixture_path
  File.expand_path("../fixtures", __FILE__)
end

def fixture(file)
  File.new(fixture_path + '/' + file)
end

def ted_url(url)
  #{@client.api_key}
  "https://api.ted.com#{url}"
end
