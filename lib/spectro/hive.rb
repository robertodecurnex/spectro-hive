require 'json'
require 'mongo'
require 'spectro'

module Spectro

  class Hive

    def call env
      request = Rack::Request.new(env)

      if request.path.match /^\/api\//
        if request.path == '/api/specs'
          if request.post?
            mongo_client = Mongo::Client.new(ENV['MONGODB'] || 'mongodb://127.0.0.1:27017/spectro')

            specs = YAML.load(request.body.read).values.flatten.collect do |spec|
              mongo_client[:specs].update_one({md5: spec.md5}, {md5: spec.md5, yaml: YAML.dump(spec)})
            end
          elsif request.get?
            mongo_client = Mongo::Client.new(ENV['MONGODB'] || 'mongodb://127.0.0.1:27017/spectro')

            specs = mongo_client[:specs].find.to_a

            return ['200', {'Content-Type' => 'text/html'}, [specs.to_json]]
          end
        end

        return ['200', {'Content-Type' => 'text/html'}, ['']]
      end

      return ['200', {'Content-Type' => 'text/html'}, [File.read('public/index.html')]]
    end

  end

end
