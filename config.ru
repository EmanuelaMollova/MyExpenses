require 'sinatra/base'

module MyExpenses
  class MyExpensesBase < Sinatra::Base
    set :views, File.expand_path('../views', __FILE__)
  end
end

require './controllers/website_controller.rb'
map('/') { run MyExpenses::WebsiteController }
