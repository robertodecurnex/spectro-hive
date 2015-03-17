require 'spectro'

module Spectro

  class Server

    def call env
      return ['200', {'Content-Type' => 'text/html'}, ['']]
    end

  end

end
