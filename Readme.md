Live Coding an HTTP Server
==========================

Ty [ThoughtWorks](https://www.thoughtworks.com/)
and [Chicago Ruby](http://www.meetup.com/ChicagoRuby/events/224923424/).

[Video](https://vimeo.com/157390424) of the presentation
(downloading the higher quality version is the best way to see, due to the resolution).

Some context
------------

See requests and responses and such:
[https://vimeo.com/150717928](https://vimeo.com/150717928)


Sorta have a plan
-----------------

1. What is HTTP? See a request and response
   * Browser will send request: `$ nc -l 3000` (now make a request)
   * Will receive a response: `$ curl -i google.com`
2. What is a webserver?
   * Receives the request
   * Parses it into a hash (the hash is defined by the "rack" interface)
   * Passes it to the app (anything with a call method)
   * Writes the response into HTML
3. Get a working example
4. Turn that into an acceptance test to drive out wiring
6. Unit tests
7. ???
8. Profit!
