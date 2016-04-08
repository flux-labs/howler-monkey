import Cycle from '@cycle/core';
import {makeDOMDriver, hJSX} from '@cycle/dom';


const inputIds = ['#source', '#listener'];
const location = '-location input.';
const dimensions = ['x', 'y', 'z'];
const queries = inputIds.reduce((memo, input) => {
  return memo.concat(dimensions.map(dim => input + location + dim))
}, []);


function _isValidInputState(state) {
  var keys = Object.keys(state);
  return keys.length  === 6 && keys.reduce(function(acc, key) {
    return acc && !isNaN(state[key].value);
  }, true);
}


function main(drivers) {

  const inputs = queries.map(query => drivers.DOM.select(query).events('keyup')
  .map(ev => {
    return {
      value: Number(ev.target.value),
      selector: query
    };
  }));

  const inputValues = Rx.Observable.merge(inputs).scan((acc, x) => {
    acc[x.selector] = x.value;
    return acc;
  }, {});

  const submitClicks = drivers.DOM.select('#obj-submit').events('click');


  return {
    DOM: submitClicks.map(_ => _isValidInputState(inputState))
    .startWith(true)
    .map(valid =>
      <div id="input-status">
        <textarea className="text-entry">
          enter a mesh here
        </textarea>
        <div id="source-location">
          <input className="x" type="text" placeholder="x"></input>
          <input className="y" type="text" placeholder="y"></input>
          <input className="z" type="text" placeholder="z"></input>
        </div>
        <div id="listener-location">
          <input className="x" type="text" placeholder="x"></input>
          <input className="y" type="text" placeholder="y"></input>
          <input className="z" type="text" placeholder="z"></input>
        </div>
        <button id="obj-submit">send obj</button>
      </div>
    )
  };
}

const drivers = {
  DOM: makeDOMDriver('#app')
}

Cycle.run(main, drivers);

