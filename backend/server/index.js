'use strict';

const Hapi = require('hapi');
const Path = require('path');

const nodeMods = Path.join(__dirname, 'node_modules');
const rx = Path.join(nodeMods, 'rx/dist/rx.all.min.js');
const system = Path.join(nodeMods, 'systemjs/dist/system.js');
const pub = Path.join(__dirname, 'public');
const index = Path.join(pub, 'index.html');
const wav = Path.join(__dirname, 'lol.wav');
const exec = require('child_process').exec;
var fs = require('fs');

const server = new Hapi.Server({
  connections: {
    routes: {
      files: {
        relativeTo: pub
      }
    }
  }
});

server.connection({port: 3000});

server.register(require('inert'), (err) => {
  if (err) {
    throw err;
  }
});

server.route({
  method: 'GET',
  path: '/scripts/node_modules/{module*}',
  handler: {
    directory: {
      path: nodeMods,
      redirectToSlash: true
    }
  }
});

server.route({
  method: 'GET',
  path: '/',
  handler: {
    file: index
  }
});

server.route({
  method: 'GET',
  path: '/system.js',
  handler: {
    file: system
  }
});

server.route({
  method: 'GET',
  path: '/rx.js',
  handler: {
    file: rx
  }
});

server.route({
  method: 'GET',
  path: '/scripts/{script*}',
  handler: {
    directory: {
      path: './scripts',
      redirectToSlash: true
    }
  }
})

server.route({
  method: 'POST',
  path: '/make-impulse/',
  handler: function(request, response) {
    fs.writeFile("dump.json", JSON.stringify(request.payload), function(err) {
      if(err) {
          return console.log(err);
      }

      console.log("The file was saved!");
    });
    exec('../../dist/output-rays dump.json lol.wav', (err, stdout, stderr) => {
      if (err) {
        console.error(err);
        return;
      }
      response('lol.wav');
    });
  }
});

server.route({
  method: 'GET',
  path: '/lol.wav',
  handler: {
    file: wav
  }
});

server.start((err) => {
  if (err) {
    throw err;
  }
  console.log('Server running at:', server.info.uri);
});



