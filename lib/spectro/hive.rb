require 'spectro'

module Spectro

  class Hive

    def call env
      return ['200', {'Content-Type' => 'text/html'}, ['']]
    end

  end

end
