require './my_app'

PATHS.each { |path, controller|  map(path) { run controller } }
