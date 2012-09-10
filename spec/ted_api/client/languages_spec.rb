require 'spec_helper'

describe TedApi::Client::Languages do

  after(:each) do
    TedApi.reset
  end

  # JSON Tests:

  it "should list Ted events in json" do
    @client = TedApi::Client.new(api_key: 'foo')
    stub_get("languages.json?api-key=foo").
      to_return(:body => fixture("languages.json"))
    response = @client.languages
    response.languages.first.language.language_code.should == 'af'
  end 
  
  it "should return a specific Ted event in json" do
    @client = TedApi::Client.new(api_key: 'foo')
    stub_get("languages/af.json?api-key=foo").
      to_return(:body => fixture("language.json"))
    response = @client.languages('af')
    response.language.language_code.should == 'af'
  end 
  
  # XML Tests:
  
  it "should list Ted events in xml" do
    @client = TedApi::Client.new(api_key: 'foo', response_format: 'xml')
    stub_get("languages.xml?api-key=foo").
      to_return(:body => fixture("languages.xml"))
    response = @client.languages
    response.languages.first.first.should == 'language'
  end
  
  it "should return a specific Ted event in xml" do
    @client = TedApi::Client.new(api_key: 'foo', response_format: 'xml')
    stub_get("languages/af.xml?api-key=foo").
      to_return(:body => fixture("language.xml"))
    response = @client.languages('af')
    response.language.language_code.should == 'af'
  end
  
  
end