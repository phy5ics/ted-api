require 'spec_helper'

describe TedApi::Client::Themes do

  after(:each) do
    TedApi.reset
  end

  # JSON Tests:

  it "should list themes in json" do
    @client = TedApi::Client.new(api_key: 'foo')
    stub_get("themes.json?api-key=foo").
      to_return(:body => fixture("themes.json"))
    response = @client.themes
    response.themes.first.theme.slug.should == 'the_creative_spark'
  end 
  
  it "should return a specific theme in json" do
    @client = TedApi::Client.new(api_key: 'foo')
    stub_get("themes/1.json?api-key=foo").
      to_return(:body => fixture("theme.json"))
    response = @client.themes('1')
    response.theme.slug.should == 'the_creative_spark'
  end 
  
  # XML Tests:
  
  it "should list themes in xml" do
    @client = TedApi::Client.new(api_key: 'foo', response_format: 'xml')
    stub_get("themes.xml?api-key=foo").
      to_return(:body => fixture("themes.xml"))
    response = @client.themes
    response.themes.first.first.should == 'theme'
  end
  
  it "should return a specific theme in xml" do
    @client = TedApi::Client.new(api_key: 'foo', response_format: 'xml')
    stub_get("themes/1.xml?api-key=foo").
      to_return(:body => fixture("theme.xml"))
    response = @client.themes('1')
    response.theme.slug.should == 'the_creative_spark'
  end
  
  
end