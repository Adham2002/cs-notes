var http = require('http');

// create server object
http.createServer(function (req, res) {                         // function take responce (which we add to and retrun to the client) and request (the url used to access the page) arguments
  res.writeHead(200, {'Content-Type': 'text/html'});            // add a http header to define the content type on the page (first arg is status code 200 which means OK)
  res.write(req.url);                                           // add the part of the url that comes after the domain name to the responce (for http://localhost:8080/summer it is /summer)
  res.end();                                                    // end the response
}).listen(8080);                                                // server will listen to port 8080 and run code when someone tries to access it


// res


// req