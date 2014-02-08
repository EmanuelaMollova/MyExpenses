require 'spec_helper'

module MyExpenses
  describe AuthenticationHelpers do
    include MyExpenses::AuthenticationHelpers

    it "should check if password is long enough" do
      short_password('abcdef').should eq nil
      short_password('').should eq "The password is too short."
    end
  end
end
