require 'spec_helper'

describe TedApi::Client::Events do

  after(:each) do
    TedApi.reset
  end

  # JSON Tests:

  it "should list Ted events in json" do
    @client = TedApi::Client.new(api_key: 'foo')
    stub_get("events.json?api-key=foo").
      to_return(:body => fixture("events.json"))
    response = @client.events
    response.counts.total.should == 211
  end 
  
  it "should return a specific Ted event in json" do
    @client = TedApi::Client.new(api_key: 'foo')
    stub_get("events/1.json?api-key=foo").
      to_return(:body => fixture("event.json"))
    response = @client.events('1')
    response.event.name.should == 'TED2008'
  end 
  
  # XML Tests:
  
  it "should list Ted events in xml" do
    @client = TedApi::Client.new(api_key: 'foo', response_format: 'xml')
    stub_get("events.xml?api-key=foo").
      to_return(:body => fixture("events.xml"))
    response = @client.events
    response.counts.total.should == "211"
  end
  
  it "should return a specific Ted event in xml" do
    @client = TedApi::Client.new(api_key: 'foo', response_format: 'xml')
    stub_get("events/1.xml?api-key=foo").
      to_return(:body => fixture("event.xml"))
    response = @client.events('1')
    response.event.name.should == 'TED2008'
  end
  
  
end