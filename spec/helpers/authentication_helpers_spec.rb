require 'spec_helper'

module MyExpenses
  describe AuthenticationHelpers do
    include MyExpenses::AuthenticationHelpers

    it "should check if password is long enough" do
      short_password('abcdef').should eq nil
      short_password('').should eq "The password is too short."
    end

    it "should check if the passwords match" do
      passwords_dont_match('abc', 'abc').should eq nil
      passwords_dont_match('123', 'abc').should eq "The passwords don't match."
    end

    it "should check if passwords meet criteria" do
      passwords_dont_meet_criteria('q1w2e3', 'q1w2e3').should eq nil
      passwords_dont_meet_criteria('q1w2e3', 'q1w2e').should eq "The passwords don't match."
      passwords_dont_meet_criteria('q1', 'q1').should eq "The password is too short."
    end
  end
end
