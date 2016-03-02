Omg lets build a webserver!! `<3`
=================================

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
