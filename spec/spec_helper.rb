require 'rack/test'
require_relative '../my_app'

RSpec.configure do |config|
  config.include Rack::Test::Methods
  DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/a_test.db")
  DataMapper.finalize
  MyExpenses::User.auto_migrate!
end

def app
  MyExpenses::MyExpensesBase
end
