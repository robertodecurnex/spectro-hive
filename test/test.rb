require 'codeclimate-test-reporter'
CodeClimate::TestReporter.start
###################################

require 'minitest/autorun'

require 'spectro/server'

require_relative 'minitest/spectro/test_server'
