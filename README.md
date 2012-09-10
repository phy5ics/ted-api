# TedApi Client

This gem wraps the TED Talks API making calls using Faraday.  It includes support for both Hashie parsed JSON and XML in addition to providing raw response formats.  It contains a 1:1 match for all API calls including the duplicate and somewhat useless ones such as languages and events.  All calls are tested for both JSON and XML responses.

You will need a TED API key to consume the API and there are currently only 50 that have been given out.  I was lucky enough that my proposal was accepted to receive one for my TED-API-50 project.  Hopefully they will open up the API to the public soon so that I won't have written this gem for the 50 of us.  See http://developer.ted.com/ for additional information.

## Installation

Add this line to your application's Gemfile:

    gem 'ted_api'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ted_api

## Usage

Basic usage 

The wrapper defaults to json responses for the API:

	@client = TedApi::Client.new(api_key: 'xxx')
	
	# Returns a list of talks:
	@client.talks
	
	# Returns a specific talk id
	@client.talks(1)

Consuming the XML API is very straightforward:

	@client = TedApi::Client.new(api_key: 'xxx', response_format='xml')
	
To bypass Hashie and ParseXML or ParseJSON for the raw response, just set raw to true:
	
	@client.talks(1, {}, true)

To pass additional options:

	@client.speakers(nil, {filter: 'lastname:Kurzweil'})

See http://developer.ted.com/API_Docs for additional details

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

