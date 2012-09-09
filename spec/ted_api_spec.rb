# -*- encoding: utf-8 -*-
require 'spec_helper'

describe TedApi do
  after do
    TedApi.reset
  end

  describe ".respond_to?" do
    it "should be true if method exists" do
      TedApi.respond_to?(:new, true).should be_true
    end
  end

  describe ".new" do
    it "should be a TedApi::Client" do
      TedApi.new.should be_a TedApi::Client
    end
  end

end
