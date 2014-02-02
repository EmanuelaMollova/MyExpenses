require 'rubygems'
require 'bundler'

module MyExpenses
  Bundler.require

  class MyExpensesBase < Sinatra::Base
    set :views, File.expand_path('../views', __FILE__)
  end
end

require './controllers/website_controller.rb'
map('/') { run MyExpenses::WebsiteController }
