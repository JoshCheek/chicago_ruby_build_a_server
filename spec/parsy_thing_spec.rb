require 'doltata'

RSpec.describe 'Doltata.parsy_thing' do
  before do
    @read, @write = IO.pipe
    @write.print "POST /somepath HTTP/1.1\r\n"
    @write.print "Location: http://www.google.com/\r\n"
    @write.print "Content-Type: text/html; charset=UTF-8\r\n"
    @write.print "Date: Wed, 02 Mar 2016 01:09:43 GMT\r\n"
    @write.print "Expires: Fri, 01 Apr 2016 01:09:43 GMT\r\n"
    @write.print "Cache-Control: public, max-age=2592000\r\n"
    @write.print "Server: gws\r\n"
    @write.print "Content-Length: 9\r\n"
    @write.print "X-XSS-Protection: 1; mode=block\r\n"
    @write.print "X-Frame-Options: SAMEORIGIN\r\n"
    @write.print "\r\n"
    @write.print "some body"
    @env = Doltata.parsy_thing(@read)
  end

  after do
    @write.close
    @read.close
  end

  # "POST /somepath HTTP/1.1\r\n"
  describe 'the request line (first line)' do
    it 'parses the first token into the key REQUEST_METHOD' do
      expect(@env['REQUEST_METHOD']).to eq 'POST'
    end

    it 'parses the second token into the key PATH_INFO' do
      expect(@env['PATH_INFO']).to eq '/somepath'
    end

    it 'parses the third token into the key HTTP_VERSION' do
      expect(@env['HTTP_VERSION']).to eq 'HTTP/1.1'
    end
  end

  describe 'headers' do
    it 'converts them to upper case, with dashes instead of underscores, and prepends HTTP_' do
      expect(@env["HTTP_CACHE_CONTROL"]).to eq "public, max-age=2592000"
    end

    specify '...unless the header is the content type or length' do
      expect(@env["CONTENT_TYPE"]).to eq "text/html; charset=UTF-8"
      expect(@env["CONTENT_LENGTH"]).to eq "9"
    end
  end

  describe 'the body' do
    it 'gets put into "rack.input" as a StringIO' do
      expect(@env['rack.input'].read).to eq "some body"
    end
  end
end
