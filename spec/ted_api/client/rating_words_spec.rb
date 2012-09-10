require 'spec_helper'

describe TedApi::Client::RatingWords do

  after(:each) do
    TedApi.reset
  end

  # JSON Tests:

  it "should list rating words in json" do
    @client = TedApi::Client.new(api_key: 'foo')
    stub_get("rating_words.json?api-key=foo").
      to_return(:body => fixture("rating_words.json"))
    response = @client.rating_words
    response.rating_words.first.rating_word.name.should == 'Beautiful'
  end 
  
  it "should return a specific rating word in json" do
    @client = TedApi::Client.new(api_key: 'foo')
    stub_get("rating_words/1.json?api-key=foo").
      to_return(:body => fixture("rating_word.json"))
    response = @client.rating_words('1')
    response.rating_word.name.should == 'Beautiful'
  end 
  
  # XML Tests:
  
  it "should list rating words in xml" do
    @client = TedApi::Client.new(api_key: 'foo', response_format: 'xml')
    stub_get("rating_words.xml?api-key=foo").
      to_return(:body => fixture("rating_words.xml"))
    response = @client.rating_words
    response.rating_words.first.first.should == 'rating_word'
  end
  
  it "should return a specific rating word in xml" do
    @client = TedApi::Client.new(api_key: 'foo', response_format: 'xml')
    stub_get("rating_words/1.xml?api-key=foo").
      to_return(:body => fixture("rating_word.xml"))
    response = @client.rating_words('1')
    response.rating_word.name.should == 'Beautiful'
  end
  
  
end