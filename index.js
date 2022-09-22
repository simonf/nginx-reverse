var http = require("http");

http.createServer(function(request, response) {
  response.writeHead(200, {"Content-Type": "text/html"});
  response.write( "<html><head><title>HTTP Header Echo</title></head>" );
  response.write( "<body>" );
  response.write( "<h1>HTTP headers</h1>");
  response.write( "<table><tr><th>Header</th><th>Value</th></tr>")
  for ( h in request.headers ) {
	  response.write( "<tr id='" + h +  "'><td>" + h + "</td><td>" + request.headers[h] + "</td></tr>" );
  }
  response.write( "</table>" );
  response.write( "<p>");
  response.write(request.url);
  response.write( "</p>");
  response.write( "</body></html>" );
  response.end();
}).listen(process.env.PORT || 8888);