require 'spectro/server'

use Rack::Static, 
  index: 'index.html',
  root: 'public',
  urls: ['/images']

run Spectro::Server.new
