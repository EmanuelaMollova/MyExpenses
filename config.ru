require 'rubygems'
require 'bundler'

module MyExpenses
  Bundler.require

  class MyExpensesBase < Sinatra::Base
    set :views, File.expand_path('../views', __FILE__)
    enable :sessions

    not_found do
      haml :not_found
    end
  end
end

Dir.glob('./{models,helpers,controllers}/*.rb').each { |file| require file }

DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/development.db")

DataMapper.auto_upgrade!
DataMapper.finalize

PATHS = {
  '/'     => MyExpenses::WebsiteController,
  '/user' => MyExpenses::AuthenticationController
}

PATHS.each { |path, controller|  map(path) { run controller } }
