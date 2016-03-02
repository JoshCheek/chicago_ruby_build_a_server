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
    env    = Doltata.parsy_thing(socket)
    # get the request
    # parse it
    # hand it to the app
    # app gives me response data
    # send that back through the socket
  end
end

require 'stringio'
def Doltata.parsy_thing(socket)
  env = {}
  method, path, version = socket.gets.split
  env['REQUEST_METHOD'] = method
  env['PATH_INFO']      = path
  env['HTTP_VERSION']   = version

  loop do
    key, value = socket.gets.chomp.split(": ")
    break unless key
    key = key.upcase.tr("-", "_")
    key = "HTTP_#{key}" unless key == 'CONTENT_TYPE' || key == 'CONTENT_LENGTH'
    env[key] = value
  end

  body = socket.read env['CONTENT_LENGTH'].to_i
  env['rack.input'] = StringIO.new(body)

  env
end
