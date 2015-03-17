require 'spectro/server'

use Rack::Static, 
  index: 'index.html',
  root: 'public',
  urls: ['/favicon.ico', '/images']

run Spectro::Server.new
