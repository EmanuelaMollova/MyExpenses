require 'sinatra/base'
require 'spec_helper'

module MyExpenses
  describe AuthenticationController do
    it "should register users" do
      lambda do
        post "/user/register", params = {
          :username => 'Emanuela',
          :password  => 'q1w2e3',
          :repeated_password  => 'q1w2e3e3',
        }
      end.should {
        change(User, :count).by(1)
      }
    end

    it "should not accept short or different passwords" do
      lambda do
        post "/register", params = {
          :username => 'Emanuela',
          :password  => 'q1',
          :repeated_password  => 'q',
        }
      end.should {
        change(User, :count).by(0)
      }
    end

    it "should not accept same usernames" do
      lambda do
        post "/register", params = {
          :username => 'Emanuela',
          :password  => 'q1w2e3',
          :repeated_password  => 'q1w2e3',
        }
      end.should {
        change(User, :count).by(1)
      }
      lambda do
        post "/register", params = {
          :username => 'Emanuela',
          :password  => 'q1w2e3',
          :repeated_password  => 'q1w2e3',
        }
      end.should {
        change(User, :count).by(0)
      }
    end
  end
end
