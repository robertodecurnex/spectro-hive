require 'json'
require 'mongo'
require 'spectro'

module Spectro

  class Hive

    def call env
      request = Rack::Request.new(env)

      if request.path.match /^\/api\//
        mongo_client = Mongo::Client.new(ENV['MONGODB'] || 'mongodb://127.0.0.1:27017/spectro')
        if request.path =~ /^\/api\/specs(.json)?$/
          if request.post?
            specs = YAML.load(request.body.read).values.flatten.collect do |spec|
              results = mongo_client[:specs].update_one({md5: spec.md5}, {md5: spec.md5, yaml: YAML.dump(spec)}, {upsert: true})
            end
          elsif request.get?
            specs = mongo_client[:specs].find.to_a.collect do |spec|
              YAML.load(spec['yaml'])
            end

            return [
              '200',
              {
                'Content-Type' => 'application/javascript',
                'Access-Control-Allow-Origin' => 'http://spectrorb.herokuapp.com'
              },
              [
                {
                  data: specs.collect(&:to_hash)
                }.to_json
              ]
            ]
          end
        end

        return ['200', {'Content-Type' => 'text/html'}, ['']]
      end

      return ['200', {'Content-Type' => 'text/html'}, [File.read('public/index.html')]]
    end

  end

end
