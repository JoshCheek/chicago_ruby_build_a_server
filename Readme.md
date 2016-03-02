Live Coding an HTTP Server
==========================

Ty [ThoughtWorks](https://www.thoughtworks.com/)
and [Chicago Ruby](http://www.meetup.com/ChicagoRuby/events/224923424/).

If you like the internet
------------------------

* Join this thing:
  "twguest"
* Enter this Password:
  "draw monte autumn blythe poach"

Itinerary
---------

* 6:30 - begin
* Ray says things
* Sara says things
* You can ask me qs
* Unless I get annoyed, then you can't
* Ray will kick me out when I go over
  (sry, Ray)


Some context
------------

See requests and responses and such:
[https://vimeo.com/150717928](https://vimeo.com/150717928)

Sort have a plan
----------------

1. What is HTTP? See a request and response
   * request: `$ nc -l 3000` (now make a request)
   * response: `$ curl -i google.com`
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

