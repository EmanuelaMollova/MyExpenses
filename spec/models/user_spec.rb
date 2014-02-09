require 'spec_helper'

module MyExpenses
  describe User do
    it 'should create users' do
      expect { User.create(:username => "Emanuela", :password => 'q1w2e3')}.to_not raise_error
    end
  end
end
