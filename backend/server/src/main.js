

function main() {

  var inputs = ['#source-location input.', '#listener-location input.'];
  var dimensions = ['x', 'y', 'z']
  var queries = inputs.reduce(function(acc, input) {
    return acc.concat(dimensions.map(function(dim) {
      return input + dim;
    }));
  }, []);


  function _queryToKey(query) {
    if (~query.indexOf('source')) {
      return {
        key: 'source',
        dim: query[query.length - 1]
      };
    } else {
      return {
        key: 'listener',
        dim: query[query.length - 1]
      };
    }
  }

  document.getElementById('obj-submit').addEventListener('click', function() {
    var obj = document.getElementById('obj-entry').value;
    if (!obj || ~obj.indexOf('enter a mesh here')) {
      throw new Error('You must enter an obj');
    }

    var inputState = queries.reduce(function(acc, input) {
      var el = document.querySelector(input);
      var key = _queryToKey(input);
      acc[key.key][key.dim] = Number(el.value ? el.value : 'asdf');
      if (isNaN(acc[key.key][key.dim])) {
        throw new Error(input + ' must have a numeric value');
      }
      return acc;
    }, {
      source: {},
      listener: {}
    });

    var res = JSON.stringify({
      obj: obj,
      points: inputState
    });

    var request = new XMLHttpRequest();
    request.open('POST', '/make-impulse/', true);
    request.setRequestHeader("Content-type", "application/json");
    request.send(res);
  });
}

if (document.body) {
  main();
} else {
  document.addEventListener('DOMContentLoaded', main);
}
