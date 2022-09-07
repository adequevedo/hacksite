const quotes = {
	"key1": {
		"quote": "this is an example quote",
		"author": "me",
		"tags": ["funny", "iasip"]
	},
	"key2": {
		"quote": "this is an example quote 2",
		"author": "me",
		"tags": ["inspo"]
	}
}

// const quotes = require('./quotes.json');
//
function newQuote(){
  // fetch('./quotes.json')
  //   .then(response => response.json())
  //   .then(data => console.log(data))
  //   .catch(error => console.log(error));
  var keys = Object.keys(quotes);
  var randomKey = quotes[keys[ keys.length * Math.random() << 0]];
  // for (var point in quotes){
  //   console.log(quotes[point]["quote"])
  // }
  document.getElementById('quoteDisplay').innerHTML = randomKey["quote"];
}
