require_relative '../app'
require 'net/http'
require 'rack'
require 'doltata'

RSpec.describe 'acceptance' do
  it 'serves my double app' do
    thread = Thread.new do
      Thread.abort_on_exception = true
      Doltata.run(DoubleApp, Port: 9299, Host: 'localhost')
    end

    body = nil
    until body
      begin
        body = Net::HTTP.get(URI('http://localhost:9299'))
      rescue Errno::ECONNREFUSED
        # O.o
      end
    end
    expect(body).to include 'form'

    response = Net::HTTP.post_form(URI('http://localhost:9299/result'),
                                   number: '12')
    expect(response.body).to include 'Your number was: 24'
  end
end
