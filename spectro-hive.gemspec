Gem::Specification.new do |s|
  s.authors = ['Roberto Decurnex']
  s.date = '2015-01-13'
  s.email = 'decurnex.roberto@gmail.com'
  s.homepage = 'http://github.com/robertodecurnex/spectro-hive'
  s.license = 'MIT'
  s.name = 'spectro-hive'
  s.summary = 'Spectro HTTP server'
  s.version = '0.1'

  s.files = [
    'lib/spectro/hive.rb'
  ]

  s.extra_rdoc_files = [
    'LICENSE',
    'README.md',
    'spectro-hive.png'
  ]

  s.required_ruby_version = '>= 2.0.0'

  s.add_runtime_dependency 'mongo'
  s.add_runtime_dependency 'puma'
  s.add_runtime_dependency 'rack'
  s.add_runtime_dependency 'rake'
  s.add_runtime_dependency 'spectro'

  s.add_development_dependency 'codeclimate-test-reporter'
  s.add_development_dependency 'guard'
  s.add_development_dependency 'guard-rack'
  s.add_development_dependency 'guard-rake'
  s.add_development_dependency 'minitest'
  s.add_development_dependency 'yard'
end

