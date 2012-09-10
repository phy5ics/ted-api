require 'spec_helper'

describe TedApi::Client::Speakers do

  after(:each) do
    TedApi.reset
  end

  # JSON Tests:

  it "should list speakers in json" do
    @client = TedApi::Client.new(api_key: 'foo')
    stub_get("speakers.json?api-key=foo").
      to_return(:body => fixture("speakers.json"))
    response = @client.speakers
    response.speakers.first.speaker.description.should == 'Climate-change prophet'
  end 
  
  it "should return a specific speaker in json" do
    @client = TedApi::Client.new(api_key: 'foo')
    stub_get("speakers/2.json?api-key=foo").
      to_return(:body => fixture("speaker.json"))
    response = @client.speakers('2')
    response.speaker.description.should == 'Climate-change prophet'
  end 
  
  # XML Tests:
  
  it "should list speakers in xml" do
    @client = TedApi::Client.new(api_key: 'foo', response_format: 'xml')
    stub_get("speakers.xml?api-key=foo").
      to_return(:body => fixture("speakers.xml"))
    response = @client.speakers
    response.speakers.first.first.should == 'speaker'
  end
  
  it "should return a specific theme in xml" do
    @client = TedApi::Client.new(api_key: 'foo', response_format: 'xml')
    stub_get("speakers/2.xml?api-key=foo").
      to_return(:body => fixture("speaker.xml"))
    response = @client.speakers('2')
    response.speaker.description.should == 'Climate-change prophet'
  end
  
  
end