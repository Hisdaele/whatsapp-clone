const express = require('express');
const http = require('http');
const app = express();
const port = 5000;
const server = http.createServer(app);
const io = require('socket.io')(server);

app.use(express.json());
const clients = {};

io.on('connection', (socket) => {
    console.log('Connected');
    console.log(socket.id, 'has joined');
    socket.on('/signin', (id)=>{
        console.log(id);
        clients[id] = socket;
        //console.log(clients);
    });
    socket.on('message', (message)=>{
        console.log(message);
    }

    )
});

server.listen(port, '0.0.0.0', () => {
    console.log('Server started')
})