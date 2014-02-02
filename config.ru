require 'rubygems'
require 'bundler'

module MyExpenses
  Bundler.require

  class MyExpensesBase < Sinatra::Base
    set :views, File.expand_path('../views', __FILE__)
  end
end

Dir.glob('./{controllers}/*.rb').each { |file| require file }

PATHS = {
  '/'     => MyExpenses::WebsiteController,
  '/user' => MyExpenses::AuthenticationController
}

PATHS.each { |path, controller|  map(path) { run controller } }
