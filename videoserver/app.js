// Setup basic express server
var express = require('express');
var app = express();
var server = require('http').createServer(app);
var io = require('socket.io')(server);
var port = process.env.PORT || 3000;

server.listen(port, function () {
  console.log('Server listening at port %d', port);
});

// Routing
app.use(express.static(__dirname + '/public'));

// usernames which are currently connected to the chat
var usernames = {};
var numUsers = 0;

io.on('connection', function (socket) {
	console.log("You connected to the server!!")

	socket.on('colorPressed', function(data){
		console.log('The Color pressed was: ' + data);
		io.emit("changeBackgroundPC", data);
	});

	socket.on('webClickColor', function(data){
		console.log('The Color pressed was: ' + data);
		io.emit("changeBackgroundiOS", data);
	});

});