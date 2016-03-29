require 'spectro/hive'

use Rack::Static,
  index: 'index.html',
  root: 'public',
  urls: ['/favicon.ico', '/images']

run Spectro::Hive.new
