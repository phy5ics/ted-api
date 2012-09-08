# -*- encoding: utf-8 -*-
require 'spec_helper'

describe Ted do
  after do
    Ted::Api.reset
  end

  describe ".respond_to?" do
    it "should be true if method exists" do
      Ted::Api.respond_to?(:new, true).should be_true
    end
  end

  describe ".new" do
    it "should be a Ted::Api::Client" do
      Ted::Api.new.should be_a Ted::Api::Client
    end
  end

  describe ".delegate" do
    it "should delegate missing methods to Ted::Api::Client" do
      # stub_get("/repos/pengwynn/octokit/issues").
      #   to_return(:status => 200, :body => fixture('v3/issues.json'))
      # issues = Ted::Api.issues('pengwynn/octokit')
      # issues.last.user.login.should == 'fellix'
    end

  end
end
