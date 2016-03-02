require_relative '../app'
require 'net/http'
require 'rack'
require 'doltata'

RSpec.describe 'acceptance' do
  it 'serves my double app' do
    port = 9299

    thread = Thread.new do
      Thread.abort_on_exception = true
      Doltata.run(DoubleApp, Port: port, Host: 'localhost')
    end

    # GET /
    body = nil
    until body
      begin body = Net::HTTP.get(URI("http://localhost:#{port}"))
      rescue Errno::ECONNREFUSED
        # keep trying, b/c we don't know how long it will take the server to start
      end
    end

    # has something in it that I expect to be on the page
    expect(body).to include 'form'

    # POST /result
    uri = URI("http://localhost:#{port}/result")
    response = Net::HTTP.post_form(uri, number: '12')

    # result contains info based on my form submission
    expect(response.body).to include '2 * 12 = 24'
  end
end
