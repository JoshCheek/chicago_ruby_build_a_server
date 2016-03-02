require_relative '../app'
require 'net/http'
require 'rack'

RSpec.describe 'acceptance' do
  it 'serves my double app' do
    thread = Thread.new do
      Thread.abort_on_exception = true
      Rack::Handler.default.run(DoubleApp, Port: 9299, Host: 'localhost')
    end
    sleep 1
    body = Net::HTTP.get(URI('http://localhost:9299'))
    expect(body).to include 'form'

    response = Net::HTTP.post_form(URI('http://localhost:9299/result'),
                                   number: '12')
    expect(response.body).to include 'Your number was: 24'
  end
end
