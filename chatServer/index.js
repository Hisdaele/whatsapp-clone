const express = require('express');
const http = require('http');
const app = express();
const port = 5000;
const server = http.createServer(app);
const io = require('socket.io')(server);

app.use(express.json());

io.on('connection', (socket) => {
    console.log('Connected');
    console.log(socket.id, 'has joined')
    socket.on('/test', (msg)=>{
        console.log(msg);
    })
});

server.listen(port, '0.0.0.0', () => {
    console.log('Server started')
})