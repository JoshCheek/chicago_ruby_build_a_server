require 'sinatra/base'
class DoubleApp < Sinatra::Base
  def form
    <<-HTML
    <form action="/result" method="post">
      <input type="text" name="number">
      <p><input type="submit" value="Continue &rarr;"></p>
    </form>
    HTML
  end

  get '/' do
    form
  end

  post '/result' do
    result = params[:number].to_i*2
    "<p>Your number was: #{result}</p>\n" + form
  end
end


if $PROGRAM_NAME == __FILE__
  require_relative 'lib/doltata'
  require 'rack'
  Doltata.run(DoubleApp, Port: 3001, Host: 'localhost')
end
