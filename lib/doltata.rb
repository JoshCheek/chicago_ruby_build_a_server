require 'socket'

class Doltata
  def self.run(app, options)
    new(app, options).run
  end

  def initialize(app, options)
    @app = app
    @options = options
  end

  def run
    port   = @options[:Port]
    host   = @options[:Host]
    server = TCPServer.new(host, port)
    socket = server.accept
  end
end
