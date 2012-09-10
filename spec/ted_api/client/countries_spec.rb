require 'spec_helper'

describe TedApi::Client::Countries do

  after(:each) do
    TedApi.reset
  end

  # JSON Tests:

  it "should list countries in json" do
    @client = TedApi::Client.new(api_key: 'foo')
    stub_get("countries.json?api-key=foo").
      to_return(:body => fixture("countries.json"))
    response = @client.countries
    response.states.first.state.name.should == 'Afghanistan'
  end 
  
  it "should return a specific Ted event in json" do
    @client = TedApi::Client.new(api_key: 'foo')
    stub_get("countries/1.json?api-key=foo").
      to_return(:body => fixture("country.json"))
    response = @client.countries('1')
    response.state.name.should == 'Afghanistan'
  end 
  
  # XML Tests:
  
  it "should list Ted events in xml" do
    @client = TedApi::Client.new(api_key: 'foo', response_format: 'xml')
    stub_get("countries.xml?api-key=foo").
      to_return(:body => fixture("countries.xml"))
    response = @client.countries
    response.counts.total.should == "248"
  end
  
  it "should return a specific Ted event in xml" do
    @client = TedApi::Client.new(api_key: 'foo', response_format: 'xml')
    stub_get("countries/1.xml?api-key=foo").
      to_return(:body => fixture("country.xml"))
    response = @client.countries('1')
    response.state.name.should == 'Afghanistan'
  end
  
  
end