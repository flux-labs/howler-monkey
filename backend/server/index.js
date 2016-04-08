'use strict';

const Hapi = require('hapi');
const Path = require('path');

const nodeMods = Path.join(__dirname, 'node_modules');
const rx = Path.join(nodeMods, 'rx/dist/rx.all.min.js');
const system = Path.join(nodeMods, 'systemjs/dist/system.js');
const pub = Path.join(__dirname, 'public');
const index = Path.join(pub, 'index.html');

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
    console.log(request.payload);
  }
});

server.start((err) => {
  if (err) {
    throw err;
  }
  console.log('Server running at:', server.info.uri);
});



