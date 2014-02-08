require './my_app.rb'

PATHS.each { |path, controller|  map(path) { run controller } }
